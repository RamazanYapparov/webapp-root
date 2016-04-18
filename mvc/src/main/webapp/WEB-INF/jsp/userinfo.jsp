<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Данные пользователя</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error {
            color: #ff0000;
        }
    </style>
    <c:set value="mvc-1.0-SNAPSHOT" var="context"/>
</head>
<body>

<ul class="list-inline">
    <li><a href="/${context}/userlist">Список пользователей</a></li>
    <li><a href="/${context}/adduser">Добавить пользователя</a></li>
    <li><a href="/${context}/orderlist">Список заказов</a></li>
    <li><a href="/${context}/addorder">Добавить заказ</a></li>
</ul>
<c:set var="name" />
<form:form method="post" modelAttribute="user">

    <label for="name">Имя</label> <form:errors path="firstname" cssClass="error"/> <br/>
    <form:input path="firstname" name="name" value="${firstname}"/> <br/>

    <label for="lastname">Фамилия</label> <form:errors path="lastname" cssClass="error"/> <br/>
    <form:input path="lastname" type="text" name="lastname" value="${lastname}"/> <br/>

    <label for="age">Возраст</label> <form:errors path="age" cssClass="error"/> <br/>
    <form:input path="age" type="text" name="age" value="${age}"/> <br/>
    <input type="submit" value="Принять">
</form:form>
</body>
</html>
