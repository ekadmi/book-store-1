<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container" style="max-width: 1000px;">
    <div style="margin-bottom: 20px; text-align: center;">
        <a href="app?act=admin" class="btn">Book Management</a>
        <a href="app?act=adminOrders" class="btn" style="background: #aaa;">Order Confirmations</a>
    </div>
    
    <h2 style="text-align: center;">Admin Book Management</h2>
    
    <div style="max-width: 500px; margin: 0 auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 5px rgba(0,0,0,0.1);">
        <h3 style="text-align: center;">${not empty editBook ? 'Update Book' : 'Add New Book'}</h3>
        <form action="app" method="post" enctype="multipart/form-data">
            <input type="hidden" name="act" value="${not empty editBook ? 'update' : 'add'}">
            <c:if test="${not empty editBook}">
                <input type="hidden" name="id" value="${editBook.id}">
            </c:if>
            <input type="text" name="t" value="${editBook.title}" placeholder="Title" required>
            <input type="text" name="a" value="${editBook.author}" placeholder="Author" required>
            <input type="number" name="p" value="${editBook.price}" placeholder="Price" step="0.01" min="0" required>
            <textarea name="d" placeholder="Description" rows="4" required>${editBook.description}</textarea>
            <label>${not empty editBook ? 'Update Image (Optional):' : 'Upload Image:'}</label>
            <input type="file" name="imgFile" accept="image/*" ${not empty editBook ? '' : 'required'} style="margin-bottom: 15px; display:block;">
            <input type="submit" class="btn ${not empty editBook ? 'btn-warning' : 'btn-success'}" style="width: 100%; box-sizing:border-box;" value="${not empty editBook ? 'Update Book' : 'Add Book'}">
            <c:if test="${not empty editBook}">
                <a href="app?act=admin" class="btn" style="width:100%; margin-top:10px; display:block; text-align:center; box-sizing:border-box; background:#ccc; color:#333;">Cancel Edit</a>
            </c:if>
        </form>
    </div>

    <h2 style="margin-top: 40px; text-align: center;">Book List</h2>
    <table>
        <tr><th>ID</th><th>Image</th><th>Title</th><th>Author</th><th>Price</th><th>Action</th></tr>
        <c:forEach var="b" items="${books}">
            <tr>
                <td>${b.id}</td>
                <td><img src="${b.imageUrl}" width="40" height="50"></td>
                <td>${b.title}</td><td>${b.author}</td><td>$${b.price}</td>
                <td style="white-space: nowrap;">
                    <a href="app?act=editBook&id=${b.id}" class="btn btn-warning" style="padding: 5px 10px; font-size:12px; margin-right:5px;">Edit</a>
                    <form action="app" style="display:inline; margin:0;">
                        <input type="hidden" name="act" value="del">
                        <input type="hidden" name="id" value="${b.id}">
                        <input type="submit" class="btn btn-danger" style="padding: 5px 10px; font-size:12px;" value="Delete">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="includes/footer.jsp"/>
