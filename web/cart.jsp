<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container container-small">
    <h2>Your Shopping Cart</h2>
    <c:choose>
        <c:when test="${empty sessionScope.cart}">
            <p style="color: #777; font-style: italic;">Your cart is empty.</p>
        </c:when>
        <c:otherwise>
            <ul class="cart-list">
            <c:set var="total" value="0"/>
            <c:forEach var="item" items="${sessionScope.cart}">
                <li>
                    <span>${item.book.title} (x${item.quantity})</span>
                    <span>
                        <a href="app?act=dec&id=${item.book.id}" class="btn" style="padding: 2px 8px; margin-top:0; font-size:16px;">-</a>
                        <a href="app?act=inc&id=${item.book.id}" class="btn" style="padding: 2px 8px; margin-top:0; font-size:16px;">+</a>
                        &nbsp;&nbsp;$${item.totalPrice}
                    </span>
                </li>
                <c:set var="total" value="${total + item.totalPrice}"/>
            </c:forEach>
            </ul>
            <h3 style="text-align: right; border-top: 2px solid #eee; padding-top: 10px;">Total: $${total}</h3>
            
            <c:if test="${not empty sessionScope.user}">
                <a class="btn btn-success" href="app?act=checkout" style="float: right;">Checkout</a>
            </c:if>
            <c:if test="${empty sessionScope.user}">
                <p class="error-msg" style="text-align:right;">Please <a href="login.jsp">Login</a> to Checkout.</p>
            </c:if>
            <div style="clear:both;"></div>
        </c:otherwise>
    </c:choose>
    <a class="back-link" href="app">Continue Shopping</a>
</div>
<jsp:include page="includes/footer.jsp"/>
