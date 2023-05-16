
<%@page import="p1.EncDec"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deletion</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <style>
            div {margin-left: 7%; margin-right: 7%; background-color: white; padding-left: 75px; padding-right: 75px;
                 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);}
        </style>
    </head>
    <body style="background-color:powderblue;">
        <%
            HttpSession UserSession = request.getSession(false);
            String username = (String)UserSession.getAttribute("user");
            
            // Code if the user tries to access this page through URL
            if(UserSession.getAttribute("user") == null)
            {
                response.sendRedirect("LoginPage.html");
            }

            String[] Titles = request.getParameterValues("bugs");

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/encrypteddb", "app", "app");
            PreparedStatement ps = c.prepareStatement("delete from TICKETS where cast(TICK_TITLE as varchar(32672))=?");
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
