<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container">
    <h2>Browse Books</h2>
    <form action="app" style="margin-bottom:20px;">
        <input type="text" name="q" placeholder="Search by Title or Author..." style="width: auto; display: inline-block;">
        <input type="submit" value="Search">
    </form>
    
    <table>
        <tr><th>Image</th><th>Title</th><th>Author</th><th>Price</th><th>Action</th></tr>
        <c:forEach var="b" items="${books}">
            <tr>
                <td><img src="${b.imageUrl}" width="50" height="70" alt="cover"></td>
                <td>${b.title}</td><td>${b.author}</td><td>$${b.price}</td>
                <td>
                    <a class="btn btn-warning" href="app?act=details&id=${b.id}">Details</a>
                    <c:set var="inCart" value="false" />
                    <c:forEach var="item" items="${sessionScope.cart}">
                        <c:if test="${item.book.id == b.id}"><c:set var="inCart" value="true" /></c:if>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${inCart}">
                            <button class="btn" style="background:#aaa; cursor:not-allowed;" disabled>In Cart</button>
                        </c:when>
                        <c:otherwise>
                            <a class="btn" href="app?act=cart&id=${b.id}">Add to Cart</a>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="includes/footer.jsp"/>
