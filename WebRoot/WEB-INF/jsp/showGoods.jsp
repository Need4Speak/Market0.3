<%@page import="com.pancake.service.impl.ShowGoodServiceImpl"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page language="java" import="com.pancake.entity.*, com.pancake.dao.*, java.util.Iterator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">@import url(css/style.css);</style>
	<style type="text/css">
		body{ text-align:center} 
		/* css 注释：这样设置了对象divcss5宽度为300px样式 */ 
		.divcssTop{
					width:250px;
					height:80px;
					margin: 0 auto;
  					padding: 0;
  					background: #FF4040;}
		.divcssMiddle{
					width:250px;
					height:40px;
					margin: 0 auto;
  					padding: 0;
  					background: #FF6A6A;}
		.divcssBottom{
					width:250px;
					margin: 0 auto;
  					padding: 0;
  					background: #FAEBD7;}
	</style>
  </head>
  
  <body>
    <div  class="divcssTop">二手交易网站</div>
    
    <div  class="divcssMiddle">
        <table width="250px" height="40px" border="1" cellspacing="0" cellpadding="0">
        	<tr>
			    <td ><a href="showGoodsController">全部商品</a></td>
			    <td><%@ include file="userLoginBar.jsp"%></td>
		  	</tr>
        </table>
    </div>
    <div>
    <ul id="nav"> 
	<li><a href="showGoodsController?classification_id=2">电子产品</a></li> 
	<li><a href="showGoodsController?classification_id=3">服装</a></li> 
	<li><a href="showGoodsController?classification_id=4">化妆品</a></li> 
	<li><a href="showGoodsController?classification_id=5">食品</a></li> 
	<li><a href="showGoodsController?classification_id=6">图书</a></li> 
	<li><a href="showGoodsController?classification_id=1">其他</a></li> 
	</ul> 
    </div>
    <div  class="divcssBottom">
    <c:forEach items="${goodForms}" var="goodForm">
    	<c:if test="${goodForm.status == 1}"> 
	    	<a href="goodInfoController?goodId=${goodForm.goodId}">  
			<table width="250px" height="150px" border="1" cellspacing="0" cellpadding="0">
			  <tr height="20px">
			    <td >卖家昵称:${goodForm.userName}</td>
			    <td>价格:${goodForm.price}</td>
			  </tr>
			  <tr>
			    <td width="125px"><img src="images/${goodForm.userName}/goodPics/${goodForm.pictures[0]}" border="0" width="120px" height="90px" /></td>
			    <td><img src="images/${goodForm.userName}/goodPics/${goodForm.pictures[1]}" border="0" width="120px" height="90px" /></td>
			  </tr>
			  <tr height="50px">
			    <td>商品名:${goodForm.goodName}</td>
			    <td>分类:${goodForm.classificationNameString}</td>
			  </tr>
			</table>
			</a>
		</c:if>
	</c:forEach> 
    </div>
    <%@ include file="bar/foot_bar.jsp"%>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
