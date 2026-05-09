<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container mb-5">
    <!-- Admin Navigation -->
    <div class="d-flex justify-content-center mb-4">
        <div class="btn-group" role="group">
            <a href="app?act=admin" class="btn btn-primary px-4"><i class="fa-solid fa-book me-2"></i>Book Management</a>
            <a href="app?act=adminOrders" class="btn btn-outline-primary px-4"><i class="fa-solid fa-list-check me-2"></i>Order Confirmations</a>
        </div>
    </div>
    
    <div class="row g-4">
        <!-- Add/Edit Form -->
        <div class="col-lg-4">
            <div class="card shadow-sm">
                <div class="card-body p-4">
                    <h4 class="card-title fw-bold mb-4 text-center">${not empty editBook ? 'Update Book' : 'Add New Book'}</h4>
                    <form action="app" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="act" value="${not empty editBook ? 'update' : 'add'}">
                        <c:if test="${not empty editBook}">
                            <input type="hidden" name="id" value="${editBook.id}">
                        </c:if>
                        
                        <div class="mb-3">
                            <label class="form-label text-muted fw-semibold">Title</label>
                            <input type="text" name="t" class="form-control" value="${editBook.title}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-muted fw-semibold">Author</label>
                            <input type="text" name="a" class="form-control" value="${editBook.author}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-muted fw-semibold">Price (Rs.)</label>
                            <input type="number" name="p" class="form-control" value="${editBook.price}" step="0.01" min="0" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-muted fw-semibold">Description</label>
                            <textarea name="d" class="form-control" rows="4" required>${editBook.description}</textarea>
                        </div>
                        <div class="mb-4">
                            <label class="form-label text-muted fw-semibold">${not empty editBook ? 'Update Image (Optional)' : 'Upload Image'}</label>
                            <input type="file" name="imgFile" class="form-control" accept="image/*" ${not empty editBook ? '' : 'required'}>
                        </div>
                        
                        <button type="submit" class="btn ${not empty editBook ? 'btn-warning' : 'btn-primary'} w-100 fw-bold">
                            <i class="fa-solid ${not empty editBook ? 'fa-pen' : 'fa-plus'} me-2"></i>${not empty editBook ? 'Update Book' : 'Add Book'}
                        </button>
                        <c:if test="${not empty editBook}">
                            <a href="app?act=admin" class="btn btn-outline-secondary w-100 mt-2">Cancel Edit</a>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>

        <!-- Book List Table -->
        <div class="col-lg-8">
            <div class="card shadow-sm">
                <div class="card-body p-4">
                    <h4 class="card-title fw-bold mb-4">Book List</h4>
                    <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Image</th>
                                    <th>Title</th>
                                    <th>Author</th>
                                    <th>Price</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="b" items="${books}">
                                    <tr>
                                        <td>
                                            <img src="${b.imageUrl}" class="rounded border object-fit-cover" width="40" height="50">
                                        </td>
                                        <td class="fw-semibold">${b.title}</td>
                                        <td class="text-muted">${b.author}</td>
                                        <td class="fw-bold">Rs. ${b.price}</td>
                                        <td class="text-end">
                                            <a href="app?act=editBook&id=${b.id}" class="btn btn-sm btn-outline-primary me-2"><i class="fa-solid fa-pen-to-square me-1"></i>Edit</a>
                                            <form action="app" class="d-inline m-0">
                                                <input type="hidden" name="act" value="del">
                                                <input type="hidden" name="id" value="${b.id}">
                                                <button type="submit" class="btn btn-sm btn-outline-danger"><i class="fa-solid fa-trash me-1"></i>Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="includes/footer.jsp"/>
