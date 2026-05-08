<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container mb-5">
    <div class="card shadow-sm border-0">
        <div class="row g-0">
            <div class="col-md-4 text-center p-4 bg-light rounded-start">
                <img src="${b.imageUrl}" alt="${b.title}" class="img-fluid rounded shadow-sm book-details-img object-fit-contain">
            </div>
            <div class="col-md-8">
                <div class="card-body p-5 h-100 d-flex flex-column">
                    <h2 class="card-title fw-bold mb-1">${b.title}</h2>
                    <p class="text-muted fs-5 mb-4">By ${b.author}</p>
                    
                    <h3 class="text-primary fw-bold mb-4">Rs. ${b.price}</h3>
                    
                    <div class="mb-4 flex-grow-1">
                        <h5 class="fw-bold border-bottom pb-2 mb-3">Description</h5>
                        <p class="card-text text-muted lh-lg">${b.description}</p>
                    </div>
                    
                    <div class="d-flex align-items-center mt-auto">
                        <c:set var="inCart" value="false" />
                        <c:forEach var="item" items="${sessionScope.cart}">
                            <c:if test="${item.book.id == b.id}"><c:set var="inCart" value="true" /></c:if>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${inCart}">
                                <button class="btn btn-secondary btn-lg px-4 me-3" disabled><i class="fa-solid fa-check me-2"></i>In Cart</button>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-primary btn-lg px-4 me-3" href="app?act=cart&id=${b.id}"><i class="fa-solid fa-cart-plus me-2"></i>Add to Cart</a>
                            </c:otherwise>
                        </c:choose>
                        <a class="btn btn-outline-secondary btn-lg px-4" href="app">Back to Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="includes/footer.jsp"/>
