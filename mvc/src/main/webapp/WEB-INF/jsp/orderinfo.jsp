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
    <c:set value="mvc-1.0-SNAPSHOT" var="context"/>
</head>
<body>
<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="/${context}/userlist">Список пользователей</a></li>
                <li><a href="/${context}/adduser">Добавить пользователя</a></li>
                <li><a href="/${context}/orderlist">Список заказов</a></li>
                <li><a href="/${context}/addorder">Добавить заказ</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="container">
    <div class="col-md-6 center-block">
        <form:form method="post" modelAttribute="order">

            <label for="customer">Покупатель</label> <form:errors path="customer" cssClass="error"/> <br/>
            <form:select path="customerId" name="customer">
                <form:options items="${userList}" itemLabel="fio" itemValue="id"/>
            </form:select> <br/>

            <br/>

            <label for="sales">Продавец</label> <form:errors path="salesPerson" cssClass="error"/> <br/>
            <form:select path="salesPersonId" name="sales">
                <form:options items="${userList}" itemLabel="fio" itemValue="id"/>
            </form:select> <br/>

            <br/>

            <label for="product">Название товара</label> <form:errors path="product" cssClass="error"/> <br/>
            <form:input path="product" name="product"/> <br/>

            <br/>

            <label for="price">Цена</label> <form:errors path="price" cssClass="error"/> <br/>
            <form:input path="price" name="price"/>

            <br/>
            <br/>

            <input type="submit" value="Принять">
        </form:form>
    </div>
</div>
</body>
</html>
