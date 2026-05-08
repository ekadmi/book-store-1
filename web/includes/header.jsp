<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Bookstore</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="d-flex flex-column flex-md-row min-vh-100">
        <!-- Vertical Sidebar -->
        <nav class="sidebar d-flex flex-column flex-shrink-0">
            <a href="app" class="sidebar-brand">
                <i class="fa-solid fa-book-open me-2 text-primary"></i>BookStore
            </a>
            <ul class="nav nav-pills flex-column mb-auto mt-3">
                <li class="nav-item">
                    <a href="app" class="nav-link">
                        <i class="fa-solid fa-store me-2 w-20px text-center"></i> Browse Books
                    </a>
                </li>
                <li>
                    <a href="app?act=viewCart" class="nav-link">
                        <i class="fa-solid fa-cart-shopping me-2 w-20px text-center"></i> My Cart
                    </a>
                </li>
                <c:if test="${not empty sessionScope.user}">
                    <li>
                        <a href="app?act=orders" class="nav-link">
                            <i class="fa-solid fa-clock-rotate-left me-2 w-20px text-center"></i> Order History
                        </a>
                    </li>
                </c:if>
            </ul>
            
            <hr class="border-secondary mx-3">
            
            <ul class="nav nav-pills flex-column mb-4">
                <c:if test="${not empty sessionScope.user && sessionScope.user.admin}">
                    <li>
                        <a href="app?act=admin" class="nav-link text-warning">
                            <i class="fa-solid fa-shield-halved me-2 w-20px text-center"></i> Admin Panel
                        </a>
                    </li>
                </c:if>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li>
                            <a href="app?act=logout" class="nav-link text-danger">
                                <i class="fa-solid fa-right-from-bracket me-2 w-20px text-center"></i> Logout (${sessionScope.user.username})
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="login.jsp" class="nav-link">
                                <i class="fa-solid fa-arrow-right-to-bracket me-2 w-20px text-center"></i> Login
                            </a>
                        </li>
                        <li>
                            <a href="register.jsp" class="nav-link">
                                <i class="fa-solid fa-user-plus me-2 w-20px text-center"></i> Register
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
        
        <!-- Main Content Area -->
        <main class="flex-grow-1 p-4 overflow-auto">
