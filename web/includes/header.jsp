<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Online Bookstore</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="nav">
        <div>
            <a href="app">Home</a>
            <a href="app?act=viewCart">Cart</a>
            <c:if test="${not empty sessionScope.user}">
                <a href="app?act=orders">My Orders</a>
                <c:if test="${sessionScope.user.admin}">
                    <a href="app?act=admin">Admin Panel</a>
                </c:if>
            </c:if>
        </div>
        <div>
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <a href="app?act=logout">Logout (${sessionScope.user.username})</a>
                </c:when>
                <c:otherwise>
                    <a href="login.jsp">Login</a>
                    <a href="register.jsp">Register</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
