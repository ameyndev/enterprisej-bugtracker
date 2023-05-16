
<%@page import="java.sql.ResultSet"%>
<%@page import="p1.EncDec"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body>
        <%
            try 
            {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/encrypteddb", "app", "app");

                PreparedStatement ps = c.prepareStatement("select * from BTUSERS where UNAME=? and UPASSWORDS=? and ADMIN='TRUE'");
                ps.setString(1, EncDec.RFencrypt(username));
                ps.setString(2, EncDec.RFencrypt(password));
                ResultSet rs = ps.executeQuery();
                if(rs.next())
                {
                    HttpSession LoginSession = request.getSession(true);
                    LoginSession.setAttribute("user", username);
                    RequestDispatcher rd = request.getRequestDispatcher("AdminDash.jsp");
                    rd.forward(request, response);
                }
                else
                {
                    out.println("User does not exist.");
                    out.println("Try Registering Again <a href='LoginPage.html'>here</a>.");
                }
            }
            catch(Exception e)
            {
                out.println("ERROR: " + e);
            }
        %>
    </body>
</html>
