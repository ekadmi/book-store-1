<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container" style="max-width: 1000px;">
    <div style="margin-bottom: 20px; text-align: center;">
        <a href="app?act=admin" class="btn" style="background: #aaa;">Book Management</a>
        <a href="app?act=adminOrders" class="btn">Order Confirmations</a>
    </div>

    <h2 style="text-align: center;">Order Confirmations</h2>
    <table>
        <tr><th>Order ID</th><th>Buyer</th><th>Items</th><th>Total</th><th>Date</th><th>Status</th><th>Action</th></tr>
        <c:forEach var="o" items="${orders}">
            <tr>
                <td>${o.id}</td><td>${o.username}</td><td>${o.items}</td><td>$${o.total}</td><td>${o.orderDate}</td>
                <td style="color:${o.status == 'Pending' ? 'orange' : 'green'}; font-weight:bold;">${o.status}</td>
                <td>
                    <c:if test="${o.status == 'Pending'}">
                        <a class="btn btn-success" style="padding: 5px 10px; font-size:12px;" href="app?act=acceptOrder&id=${o.id}">Accept</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="includes/footer.jsp"/>
