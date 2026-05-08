<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container mb-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">Available Books</h2>
        <form action="app" class="d-flex">
            <input type="text" name="q" class="form-control me-2" placeholder="Search by title or author...">
            <button type="submit" class="btn btn-primary px-4">Search</button>
        </form>
    </div>
    
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
        <c:forEach var="b" items="${books}">
            <div class="col">
                <div class="card h-100">
                    <img src="${b.imageUrl}" class="card-img-top book-img-top" alt="${b.title}">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title fw-bold mb-1">${b.title}</h5>
                        <p class="card-text text-muted small mb-2">Author: ${b.author}</p>
                        <h6 class="card-subtitle mb-3 text-primary fw-bold">Rs. ${b.price}</h6>
                        <div class="mt-auto">
                            <c:set var="inCart" value="false" />
                            <c:forEach var="item" items="${sessionScope.cart}">
                                <c:if test="${item.book.id == b.id}"><c:set var="inCart" value="true" /></c:if>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${inCart}">
                                    <button class="btn btn-secondary w-100 mb-2" disabled><i class="fa-solid fa-check me-2"></i>In Cart</button>
                                </c:when>
                                <c:otherwise>
                                    <a class="btn btn-primary w-100 mb-2" href="app?act=cart&id=${b.id}"><i class="fa-solid fa-cart-plus me-2"></i>Add to Cart</a>
                                </c:otherwise>
                            </c:choose>
                            <a class="btn btn-outline-secondary w-100" href="app?act=details&id=${b.id}">Details</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="includes/footer.jsp"/>
