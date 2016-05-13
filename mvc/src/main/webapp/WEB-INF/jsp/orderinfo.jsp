<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Данные заказа</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/center.css" rel="stylesheet">
    <style>
        .error {
            color: #ff0000;
        }
    </style>
    <c:set value="${pageContext.request.contextPath}" var="context"/>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="${context}/userlist">Список пользователей</a></li>
                <li><a href="${context}/adduser">Добавить пользователя</a></li>
                <li><a href="${context}/orderlist">Список заказов</a></li>
                <li><a href="${context}/addorder">Добавить заказ</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="starter-template">
        <form:form method="post" modelAttribute="order">

            <label for="customer">Покупатель</label> <br/>
            <form:errors path="customer" cssClass="error"/> <br/>
            <form:select path="customerId" name="customer">
                <form:options items="${userList}" itemLabel="fio" itemValue="id"/>
            </form:select> <br/>

            <br/>

            <label for="sales">Продавец</label> <br/>
            <form:errors path="salesPerson" cssClass="error"/> <br/>
            <form:select path="salesPersonId" name="sales">
                <form:options items="${userList}" itemLabel="fio" itemValue="id"/>
            </form:select> <br/>

            <br/>

            <label for="product">Название товара</label> <br/>
            <form:errors path="product" cssClass="error"/> <br/>
            <form:input path="product" name="product"/> <br/>

            <br/>

            <label for="price">Цена</label> <br/>
            <form:errors path="price" cssClass="error"/> <br/>
            <form:input path="price" name="price"/>

            <br/>
            <br/>

            <input type="submit" value="Принять" class="btn btn-primary">
        </form:form>
    </div>
</div>
</body>
</html>
