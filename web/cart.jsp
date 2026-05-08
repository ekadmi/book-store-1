<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container mb-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm">
                <div class="card-body p-4">
                    <h2 class="mb-4 fw-bold">Your Cart</h2>
                    <c:choose>
                        <c:when test="${empty sessionScope.cart}">
                            <div class="text-center py-5">
                                <i class="fa-solid fa-cart-shopping fa-3x text-muted mb-3"></i>
                                <p class="text-muted fs-5">Your cart is empty.</p>
                                <a class="btn btn-outline-primary mt-3" href="app">Continue Shopping</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:set var="total" value="0"/>
                            <div class="list-group list-group-flush mb-4">
                                <c:forEach var="item" items="${sessionScope.cart}">
                                    <div class="list-group-item d-flex justify-content-between align-items-center py-3 px-0 border-bottom">
                                        <div class="d-flex align-items-center">
                                            <img src="${item.book.imageUrl}" alt="${item.book.title}" class="rounded me-3 border cart-thumbnail object-fit-cover">
                                            <div>
                                                <h6 class="mb-1 fw-bold">${item.book.title}</h6>
                                                <small class="text-muted">Author: ${item.book.author}</small>
                                                <div class="mt-1 text-primary fw-semibold">Rs. ${item.book.price}</div>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-column align-items-end">
                                            <div class="input-group input-group-sm mb-2 qty-input-box">
                                                <a href="app?act=dec&id=${item.book.id}" class="btn btn-outline-secondary">-</a>
                                                <input type="text" class="form-control text-center" value="${item.quantity}" readonly>
                                                <a href="app?act=inc&id=${item.book.id}" class="btn btn-outline-secondary">+</a>
                                            </div>
                                            <span class="fw-bold">Rs. ${item.totalPrice}</span>
                                        </div>
                                    </div>
                                    <c:set var="total" value="${total + item.totalPrice}"/>
                                </c:forEach>
                            </div>
                            
                            <div class="d-flex justify-content-between align-items-center bg-light p-3 rounded mb-4">
                                <span class="fs-5 fw-bold">Total:</span>
                                <span class="fs-4 fw-bold text-primary">Rs. ${total}</span>
                            </div>
                            
                            <div class="d-flex justify-content-between">
                                <a class="btn btn-outline-secondary" href="app"><i class="fa-solid fa-arrow-left me-2"></i>Continue Shopping</a>
                                <c:if test="${not empty sessionScope.user}">
                                    <a class="btn btn-primary px-4" href="app?act=checkout">Checkout <i class="fa-solid fa-arrow-right ms-2"></i></a>
                                </c:if>
                                <c:if test="${empty sessionScope.user}">
                                    <a class="btn btn-warning px-4" href="login.jsp">Login to Checkout</a>
                                </c:if>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="includes/footer.jsp"/>
