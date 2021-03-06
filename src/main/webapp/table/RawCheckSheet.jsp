<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/22
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 36px;
            font-weight: bold;
        }
        -->
    </style>
    <link type="text/css" href="style.css" rel="stylesheet" />

</head>

<body>
<form name="form1" method="post" action="">
    <p align="center" class="STYLE1">抽检单</p>
    <table width="900"  align="center">

        <tr>
            <td width="300" height="44">抽检单号：${map.CHECKNUM}</td>
            <td width="300">抽检人：${map.OPERATOR_}</td>
            <td width="300">抽检日期：<fmt:formatDate  value="${map.CHECKDATE}" pattern="yyyy-MM-dd" ></fmt:formatDate></td>
        </tr>
        <tr>
            <td width="300" height="44">委托方：${map.CLIENT}</td>
            <td width="300">发货单位：${map.DELIVERYCOM}</td>
            <td width="300">车牌号：${map.CARNUM}</td>
        </tr>
        <tr>
            <td width="225" height="45">烟草品种:${map.TOBACCOCATEGORY}</td>
            <td width="225" height="45">烟草产地:${map.PROCEDUREAREA}</td>
            <td width="225" height="45">烟草年度:${map.PROCEDUREYEAR}</td>
            <td width="225" height="45">烟草等级:${map.LEVELNAME}</td>
        </tr>

    </table>
    <table width="910" height="193" border="1" align="center" class="table" cellspacing="0" bordercolor="#000000">
        <tr>
            <td width="195"><div align="center">序号</div></td>
            <td width="705"><div align="center">抽重</div></td>
        </tr>
     <c:forEach items="${list}" var="list">
        <tr>
            <td>${list.sequence}</td>
            <td>${list.checkweight}</td>
        </tr>
     </c:forEach>
        <tr>
            <td><div align="center">平均重量</div></td>
            <td><br></td>
        </tr>

    </table>
</form>

<br>
</body>
</html>

