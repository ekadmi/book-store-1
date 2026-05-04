<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container">
    <h2>${b.title}</h2>
    <img src="${b.imageUrl}" alt="${b.title}" style="float: left; margin-right: 20px; max-width: 200px;">
    <p><strong>Author:</strong> ${b.author}</p>
    <p><strong>Price:</strong> $${b.price}</p>
    <p><strong>Description:</strong><br/> ${b.description}</p>
    <div style="clear: both; margin-bottom: 20px;"></div>
    
    <c:set var="inCart" value="false" />
    <c:forEach var="item" items="${sessionScope.cart}">
        <c:if test="${item.book.id == b.id}"><c:set var="inCart" value="true" /></c:if>
    </c:forEach>
    <c:choose>
        <c:when test="${inCart}">
            <button class="btn" style="background:#aaa; cursor:not-allowed;" disabled>In Cart</button>
        </c:when>
        <c:otherwise>
            <a class="btn btn-success" href="app?act=cart&id=${b.id}">Add to Cart</a>
        </c:otherwise>
    </c:choose>
    <a class="back-link" style="margin-left:15px;" href="app">Back to Home</a>
</div>
<jsp:include page="includes/footer.jsp"/>
