<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/center.css" rel="stylesheet">
    <title>Список пользователей</title>
    <c:set value="mvc-1.0-SNAPSHOT" var="context"/>
</head>
<body>
    <ul class="list-inline">
        <li><a href="/${context}/userlist">Список пользователей</a></li>
        <li><a href="/${context}/adduser">Добавить пользователя</a></li>
        <li><a href="/${context}/orderlist">Список заказов</a></li>
        <li><a href="/${context}/addorder">Добавить заказ</a></li>
    </ul>
<div class="col-md-6 center-block">
    <table width="500" border="1">
        <caption>Список пользователей</caption>
        <tr>
            <th>Фамилия</th>
            <th>Имя</th>
            <th>Возраст</th>
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
