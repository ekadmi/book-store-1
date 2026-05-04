<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container">
    <h2>My Orders</h2>
    <c:choose>
        <c:when test="${empty orders}">
            <p>You have not placed any orders yet.</p>
        </c:when>
        <c:otherwise>
            <table>
                <tr>
                    <th>Order ID</th>
                    <th>Items</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Date</th>
                </tr>
                <c:forEach var="o" items="${orders}">
                    <tr>
                        <td>${o.id}</td>
                        <td>${o.items}</td>
                        <td>$${o.total}</td>
                        <td style="color:${o.status == 'Pending' ? 'orange' : 'green'}; font-weight:bold;">${o.status}</td>
                        <td>${o.orderDate}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</div>
<jsp:include page="includes/footer.jsp"/>
