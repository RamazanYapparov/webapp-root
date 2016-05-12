<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/center.css" rel="stylesheet">
    <c:set value="mvc-1.0-SNAPSHOT" var="context"/>
    <title>Список заказов</title>
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

        <table width="500" border="1">
            <caption>Список заказов</caption>
            <tr>
                <th>Продавец</th>
                <th>Покупатель</th>
                <th>Товар</th>
                <th>Действия</th>
            </tr>
            <c:forEach items="${orderList}" var="order">
                <tr>
                    <td>${order.customer.firstname} ${order.customer.lastname}</td>
                    <td>${order.salesPerson.firstname} ${order.salesPerson.lastname}</td>
                    <td>${order.product}</td>
                    <td>${order.price}</td>
                    <td>
                        <form:form method="get" action="/${context}/updateorder">
                            <input type="hidden" name="id" value="${order.getId()}"/>
                            <input type="submit" value="Изменить"/>
                        </form:form>
                        <form:form method="post" action="/${context}/deleteorder">
                            <input type="hidden" name="id" value="${order.getId()}"/>
                            <input type="submit" value="Удалить">
                        </form:form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
