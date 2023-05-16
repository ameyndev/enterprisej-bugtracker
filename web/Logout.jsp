
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
            HttpSession UserSession = request.getSession(false);
            UserSession.removeAttribute("user");
            UserSession.invalidate();
            out.println("You are being logged out.");
            response.sendRedirect("LoginPage.html");
        %>
    </body>
</html>
