
<%@page import="p1.EncDec"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Resolution</title>
    </head>
    <body>
        <%
            HttpSession UserSession = request.getSession(false);
            // String username = (String)UserSession.getAttribute("user");
            
            // String[] names = request.getParameterValues("names");
            String[] Titles = request.getParameterValues("bugs");

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/encrypteddb", "app", "app");
            PreparedStatement ps = c.prepareStatement("update TICKETS SET TICK_STATE='resolved' WHERE cast(TICK_TITLE as varchar(32672))=? and TICK_STATE='unresolved'");

            for (int i = 0; i < Titles.length; i++)
            {
                // ps.setString(1, EncDec.RFencrypt(username));
                ps.setString(1, EncDec.SCencrypt(Titles[i]));
                ps.executeUpdate();
            }

            response.sendRedirect("AdminDash.jsp");
            
            // Code if the user tries to access this page through URL
            if(UserSession.getAttribute("user") == null)
            {
                response.sendRedirect("LoginPage.html");
            }
        %>
    </body>
</html>
