<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>
<div class="container mb-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-sm">
                <div class="card-body p-4">
                    <h2 class="text-center mb-4 fw-bold">User Registration</h2>
                    
                    <c:if test="${not empty err}">
                        <div class="alert alert-danger" role="alert">${err}</div>
                    </c:if>
                    <c:if test="${not empty msg}">
                        <div class="alert alert-success" role="alert">${msg}</div>
                    </c:if>

                    <form action="app">
                        <input type="hidden" name="act" value="reg">
                        <div class="mb-3">
                            <label class="form-label text-muted fw-semibold">Username (min 3 chars):</label>
                            <input type="text" name="user" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-muted fw-semibold">Email:</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label text-muted fw-semibold">Password:</label>
                            <input type="password" name="pwd" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Register</button>
                    </form>
                    <p class="text-center mt-4 mb-0">Already have an account? <a class="text-decoration-none fw-semibold" href="login.jsp">Login here</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="includes/footer.jsp"/>
