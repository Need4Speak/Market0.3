<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Add Product Form</title>
<style type="text/css">@import url(css/main.css);</style>
</head>
<body>

<div id="global">
<form action="placeOrderController?goodId=${goodForm.goodId}" method="post">
    <fieldset>
        <legend>购买宝贝</legend>
            <img src="images/${goodForm.pictures[0]}" border="0" width="120px" height="90px" /> <br/>
           	商品名称: ${goodForm.goodName} <br/>
		        价格: ${goodForm.price} <br/>
		        运费: ${goodForm.freight} <br/>
		        收货地址：<input type="text" size="20" name="address"/> <br/>
		        订单描述：<input type="text" size="20" name="description"/> <br/>
		        总价: ${goodForm.price + goodForm.freight} <br/>
		    <input type="submit" value="提交订单"/>
    </fieldset>
</form>
</div>
</body>
</html>