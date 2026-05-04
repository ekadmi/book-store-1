<jsp:include page="includes/header.jsp"/>
<div class="container container-small">
    <h2 style="text-align: center;">Login</h2>
    <p class="error-msg">${err}</p>
    <form action="app">
        <input type="hidden" name="act" value="login">
        <label>Username:</label> <input type="text" name="user" required>
        <label>Password:</label> <input type="password" name="pwd" required>
        <input type="submit" value="Login">
    </form>
    <p style="text-align: center; margin-top:20px;">Don't have an account? <a class="back-link" style="margin:0;" href="register.jsp">Register here</a></p>
</div>
<jsp:include page="includes/footer.jsp"/>
