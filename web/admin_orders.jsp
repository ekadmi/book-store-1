<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container mb-5">
    <!-- Admin Navigation -->
    <div class="d-flex justify-content-center mb-4">
        <div class="btn-group" role="group">
            <a href="app?act=admin" class="btn btn-outline-primary px-4"><i class="fa-solid fa-book me-2"></i>Book Management</a>
            <a href="app?act=adminOrders" class="btn btn-primary px-4"><i class="fa-solid fa-list-check me-2"></i>Order Confirmations</a>
        </div>
    </div>

    <div class="card shadow-sm border-0">
        <div class="card-body p-4">
            <h4 class="card-title fw-bold mb-4">Order Confirmations</h4>
            <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Order ID</th>
                            <th>Buyer</th>
                            <th>Items</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="o" items="${orders}">
                            <tr>
                                <td class="fw-semibold text-muted">#${o.id}</td>
                                <td class="fw-bold">${o.username}</td>
                                <td>${o.items}</td>
                                <td class="text-muted"><i class="fa-regular fa-calendar me-1"></i> ${o.orderDate}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${o.status == 'Pending'}">
                                            <span class="badge bg-warning text-dark"><i class="fa-solid fa-hourglass-half me-1"></i> Pending</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-success"><i class="fa-solid fa-check me-1"></i> Accepted</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-end">
                                    <c:if test="${o.status == 'Pending'}">
                                        <a class="btn btn-sm btn-success px-3" href="app?act=acceptOrder&id=${o.id}">
                                            <i class="fa-solid fa-check me-1"></i> Accept
                                        </a>
                                    </c:if>
                                    <c:if test="${o.status != 'Pending'}">
                                        <span class="text-muted">-</span>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
        </div>
    </div>
</div>
<jsp:include page="includes/footer.jsp"/>
