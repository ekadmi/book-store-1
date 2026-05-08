<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container mb-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <h2 class="mb-4 fw-bold">Your Order History</h2>
            <c:choose>
                <c:when test="${empty orders}">
                    <div class="card shadow-sm">
                        <div class="card-body text-center py-5">
                            <i class="fa-solid fa-box-open fa-3x text-muted mb-3"></i>
                            <p class="text-muted fs-5">You have not placed any orders yet.</p>
                            <a class="btn btn-primary mt-3" href="app">Browse Books</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row g-4">
                        <c:forEach var="o" items="${orders}">
                            <div class="col-12">
                                <div class="card shadow-sm border-0 border-start border-4 ${o.status == 'Pending' ? 'border-warning' : 'border-success'}">
                                    <div class="card-body p-4 d-flex justify-content-between align-items-center">
                                        <div class="d-flex align-items-center">
                                            <div class="bg-light rounded-circle p-3 me-4 d-flex align-items-center justify-content-center icon-circle-60">
                                                <c:choose>
                                                    <c:when test="${o.status == 'Pending'}">
                                                        <i class="fa-regular fa-clock fs-4 text-warning"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fa-solid fa-bag-shopping fs-4 text-success"></i>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div>
                                                <h5 class="fw-bold mb-1">${o.items}</h5>
                                                <div class="text-muted small mb-2"><i class="fa-regular fa-calendar me-1"></i> ${o.orderDate} &bull; Order ID: #${o.id}</div>
                                                <h6 class="fw-bold text-primary mb-0">Total: Rs. ${o.total}</h6>
                                            </div>
                                        </div>
                                        <div>
                                            <c:choose>
                                                <c:when test="${o.status == 'Pending'}">
                                                    <span class="badge bg-warning text-dark px-3 py-2 rounded-pill"><i class="fa-solid fa-hourglass-half me-1"></i> Pending</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-success px-3 py-2 rounded-pill"><i class="fa-solid fa-check me-1"></i> Accepted</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<jsp:include page="includes/footer.jsp"/>
