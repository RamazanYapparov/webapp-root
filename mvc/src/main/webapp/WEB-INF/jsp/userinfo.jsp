<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Данные пользователя</title>
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
</body>

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
        </div>
    </div>
</nav>
<div class="container">
    <div class="starter-template">
        <form:form method="post" modelAttribute="user">

            <label for="name">Имя</label> <form:errors path="firstname" cssClass="error"/> <br/>
            <form:input path="firstname" name="name" value="${user.firstname}"/> <br/>

            <label for="lastname">Фамилия</label> <form:errors path="lastname" cssClass="error"/> <br/>
            <form:input path="lastname" type="text" name="lastname" value="${user.lastname}"/> <br/>

            <label for="age">Возраст</label> <form:errors path="age" cssClass="error"/> <br/>
            <form:input path="age" type="text" name="age" value="${user.age}"/> <br/>
            <input type="submit" value="Принять" class="btn btn-primary">
        </form:form>
    </div>
</div>
</html>
