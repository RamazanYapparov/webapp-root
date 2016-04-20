<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ramazan
  Date: 18.04.16
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
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
<div class="col-md-6 center-block">
    <ul class="list-inline">
        <li><a href="/${context}/userlist">Список пользователей</a></li>
        <li><a href="/${context}/adduser">Добавить пользователя</a></li>
        <li><a href="/${context}/orderlist">Список заказов</a></li>
        <li><a href="/${context}/addorder">Добавить заказ</a></li>
    </ul>
    <table width="500" border="1">
        <caption>Список заказов</caption>
        <tr>
            <th>Продавец</th>
            <th>Покупатель</th>
            <th>Товар</th>
            <th>Действия</th>
        </tr>
        <c:forEach items="${userList}" var="user">
            <tr>
                <td>${user.getFirstname()}</td>
                <td>${user.getLastname()}</td>
                <td>${user.getAge()}</td>
                <td>
                    <ul class="list-inline">
                        <li><a href="/${context}/userupdate?id=${user.getId()}">Изменить</a></li>
                        <li><a href="/${context}/userdelete?id=${user.getId()}">Удалить</a></li>
                    </ul>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
