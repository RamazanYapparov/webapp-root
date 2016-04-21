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
<div class="col-md-6 center-block">
    <ul class="list-inline">
        <li><a href="/${context}/userlist">Список пользователей</a></li>
        <li><a href="/${context}/adduser">Добавить пользователя</a></li>
        <li><a href="/${context}/orderlist">Список заказов</a></li>
        <li><a href="/${context}/addorder">Добавить заказ</a></li>
    </ul>
    <div class="col-md-6 center-block">
        <form:form method="post" modelAttribute="order">

            <label for="customer">Покупатель</label> <form:errors path="customer" cssClass="error"/> <br/>
            <form:select path="customerId" name="customer">
                <form:options items="${userList}" itemLabel="fio" itemValue="id"/>
            </form:select> <br/>

            <label for="sales">Продавец</label> <form:errors path="salesPerson" cssClass="error"/> <br/>
            <form:select path="salesPersonId" name="sales">
                <form:options items="${userList}" itemLabel="fio" itemValue="id"/>
            </form:select> <br/>
            <input type="submit" value="Принять">
        </form:form>
    </div>
</body>
</html>
