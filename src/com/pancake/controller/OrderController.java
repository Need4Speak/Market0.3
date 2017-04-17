package com.pancake.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pancake.entity.GoodForm;
import com.pancake.entity.OrderTable;
import com.pancake.service.ShowGoodService;
import com.pancake.service.ShowOrderService;
import com.pancake.service.UserService;
import com.pancake.service.impl.ShowGoodServiceImpl;
import com.pancake.service.impl.ShowOrderServiceImpl;
import com.pancake.util.SplitStrIntoList;

@Controller
public class OrderController {
	private static final Log logger = LogFactory.getLog(ShowGoodsController.class);
	@Autowired
	private ShowGoodService sgsi;
	@Autowired
	private UserService userService;
	@Autowired
	private ShowOrderService soService;

	@RequestMapping(value = "/tryPlaceOrderController")
	public ModelAndView tryPlaceOrder(HttpServletRequest request, HttpServletResponse response) {
		logger.info("placeOrderController called");
		ModelAndView mav = new ModelAndView("try_place_order");

		int goodId = Integer.parseInt(request.getParameter("goodId"));
		GoodForm goodForm = sgsi.showGoodInfo(goodId);

		mav.addObject("goodForm", goodForm);
		return mav;
	}

	@RequestMapping(value = "/placeOrderController")
	public ModelAndView placeOrder(HttpServletRequest request, HttpServletResponse response) {
		logger.info("placeOrderController called");
		ModelAndView mav = new ModelAndView("showOrder");

		int goodId = Integer.parseInt(request.getParameter("goodId"));
		GoodForm goodForm = sgsi.showGoodInfo(goodId);

		String address = request.getParameter("address").trim();
		String description = request.getParameter("description").trim();
		String buyerName = (String) request.getSession().getAttribute("userName");

		ShowOrderServiceImpl sosi = new ShowOrderServiceImpl();
		OrderTable orderForm = sosi.createOrder(buyerName, goodId, address, description);

		mav.addObject("goodForm", goodForm);
		mav.addObject("orderForm", orderForm);
		return mav;
	}

	@RequestMapping(value = "/orderListController")
	public ModelAndView orderList(HttpSession session, HttpServletRequest request) {
		logger.info("orderListController called");
		ModelAndView mav = new ModelAndView("orderList");

		int orderStatus = Integer.parseInt(request.getParameter("orderStatus"));
		String userName = ((String) session.getAttribute("userName")).trim();
		List<OrderTable> orderList = soService.getOrderByBuyerName(userName);
		OrderTable order = null;
		for (Iterator<OrderTable> iterator = orderList.iterator(); iterator.hasNext();) {
			order = (OrderTable) iterator.next();
			// 将某件商品的第一张图片存入 pictures 属性里，用于显示。
			List<String> picList = SplitStrIntoList.run(order.getGood().getPictures());
			order.getGood().setPictures(picList.get(0));
			if (-1 != orderStatus && order.getStatus() != orderStatus) {
				iterator.remove();
			}
		}
		mav.addObject("orderList", orderList);
		return mav;
	}

	@RequestMapping(value = "/SellerOrderListController")
	public ModelAndView sellerOrderList(HttpSession session, HttpServletRequest request) {
		logger.info("orderListController called");
		ModelAndView mav = new ModelAndView("orderListSell");

		int orderStatus = Integer.parseInt(request.getParameter("orderStatus"));
		String userName = ((String) session.getAttribute("userName")).trim();
		List<OrderTable> orderList = soService.getOrderBySellerName(userName);
		OrderTable order = null;
		for (Iterator<OrderTable> iterator = orderList.iterator(); iterator.hasNext();) {
			order = (OrderTable) iterator.next();
			// 将某件商品的第一张图片存入 pictures 属性里，用于显示。
			List<String> picList = SplitStrIntoList.run(order.getGood().getPictures());
			order.getGood().setPictures(picList.get(0));
			if (-1 != orderStatus && order.getStatus() != orderStatus) {
				iterator.remove();
			}
		}
		mav.addObject("orderList", orderList);
		return mav;
	}

	@RequestMapping(value = "/orderCancelController/{orderId}")
	public String orderCancel(Model model, @PathVariable int orderId) {
		logger.info("orderCancelController called");
		OrderTable order = soService.getOrderById(orderId);
		// Set the status of order to 0, 0 means cancel.
		order.setStatus(0);
		Timestamp cancelTime = new Timestamp(System.currentTimeMillis());
		order.setCancelTime(cancelTime);
		soService.update(order);
		return "redirect:/orderListController?orderStatus=1";

	}

	@RequestMapping(value = "/orderDetailController/{orderId}")
	public ModelAndView orderDetail(Model model, @PathVariable int orderId) {
		logger.info("orderCancelController called");
		OrderTable order = soService.getOrderById(orderId);
		GoodForm goodForm = sgsi.showGoodInfo(order.getGood().getGoodId());

		ModelAndView mav = new ModelAndView("orderDetail");
		mav.addObject("goodForm", goodForm);
		mav.addObject("order", order);

		return mav;

	}
}
