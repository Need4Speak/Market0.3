<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>下单</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
         <style type="text/css">
            body{
               background-color: #ffffff;
               padding: 10px;
            }
            img{
               width: 120px;
               height: 120px;
               padding: auto auto;
               float: left;
               margin-right: 20px;
            }
            .discription{
               font-size: 14px;
               margin-bottom: 20px;
            }
            .price{
               font-size: 13px;
               color: red;
               margin-bottom: 20px;
            }
            .location{
               font-size: 11px;
               color: #A9A9A9;
               letter-spacing: 1PX;
               margin-right: 5PX;
            }
            hr{
               border-width: 1px;
               border-color: #efefef;
            }
            .word{
               color: #A9A9A9;
            }
            input{
               border-width: 0px;
               float: right;
               text-align: right;
            }
            .price1{
               color: red;
               float: right;
               font-size: 15px;
               font-style: bold;
            }
            button{
               letter-spacing: 5px;
               margin-top: 20px;
            }
         </style>
   </head>
   <body>
      <div class="container">
		<form action="placeOrderController?goodId=${goodForm.goodId}" method="post">
         <div class="row clearfix">
            <div class="col-md-4 column">
               <img class="product" src="images/${goodForm.userName}/goodPics/${goodForm.pictures[0]}">
            </div>
            <div class="col-md-8 column">
               <div class="row clearfix">
                  <div class="col-md-12 column">
                     <p class="discription">${goodForm.goodName}</p>
                     <p class="price">￥${goodForm.price}</p>
                     <span class="location">四川大学</span>
                  </div>
               </div>
            </div>
         </div>
         <hr/>
         <div class="row clearfix">
            <div class="col-md-12 column">
               <span class="word">收货地址</span>
               <input type="text" name="address" placeholder="请输入准确的收货地址">
            </div>
         </div>
         <hr/>
         <div class="row clearfix">
            <div class="col-md-12 column">
               <span class="word">订单描述</span>
               <input type="text" name="description" placeholder="留言给卖家">
            </div>
         </div>
         <hr/>
         <div class="row clearfix">
            <div class="col-md-12 column">
               <span class="word">运费</span>
               <span class="price1">￥${goodForm.freight}</span>
            </div>
         </div>
         <hr/>
         <div class="row clearfix">
            <div class="col-md-12 column">
               <span class="word">实付金额</span>
               <span class="price1">￥${goodForm.price+goodForm.freight}</span>
            </div>
         </div>
         <hr/>
		<div class="row clearfix">
		    <div class="col-md-12 column">
		        <button type="submit" class="btn btn-danger btn-lg btn-block active">确 定</button>
		    </div>
		</div>
		</form>
</div>
<%@ include file="bar/foot_bar.jsp"%>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>
</body>

</html>

