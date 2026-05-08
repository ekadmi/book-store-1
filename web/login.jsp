<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container mb-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-sm">
                <div class="card-body p-4">
                    <h2 class="text-center mb-4 fw-bold">Login</h2>
                    
                    <c:if test="${not empty err}">
                        <div class="alert alert-danger" role="alert">${err}</div>
                    </c:if>
                    
                    <form action="app">
                        <input type="hidden" name="act" value="login">
                        <div class="mb-3">
                            <label class="form-label text-muted fw-semibold">Username:</label>
                            <input type="text" name="user" class="form-control" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label text-muted fw-semibold">Password:</label>
                            <input type="password" name="pwd" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </form>
                    <p class="text-center mt-4 mb-0">Don't have an account? <a class="text-decoration-none fw-semibold" href="register.jsp">Register here</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="includes/footer.jsp"/>
