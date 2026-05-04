<jsp:include page="includes/header.jsp"/>
<div class="container container-small">
    <h2 style="text-align: center;">User Registration</h2>
    <p class="error-msg">${err}</p>
    <p class="success-msg">${msg}</p>
    <form action="app">
        <input type="hidden" name="act" value="reg">
        <label>Username (min 3 chars):</label> <input type="text" name="user" required>
        <label>Email:</label> <input type="email" name="email" required>
        <label>Password:</label> <input type="password" name="pwd" required>
        <input type="submit" value="Register">
    </form>
    <p style="text-align: center; margin-top:20px;"><a class="back-link" style="margin:0;" href="login.jsp">Already have an account? Login</a></p>
</div>
<jsp:include page="includes/footer.jsp"/>
