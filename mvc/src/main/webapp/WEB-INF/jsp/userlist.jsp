<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/center.css" rel="stylesheet">
    <title>Список пользователей</title>
    <c:set value="mvc-1.0-SNAPSHOT" var="context"/>
</head>
<body>
<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container">
        <%--<div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>--%>
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
        <table width="400" border="1">
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
                        <form:form method="get" action="/${context}/userupdate">
                            <input type="hidden" name="id" value="${user.getId()}"/>
                            <input type="submit" value="Изменить"/>
                        </form:form>
                        <form:form method="post" action="/${context}/userdelete">
                            <input type="hidden" name="id" value="${user.getId()}"/>
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
