
<%@page import="p1.EncDec"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resolve Bugs</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <style>
            .dashboard {margin-left: 7%; margin-right: 7%; background-color: white; padding-left: 75px; padding-right: 75px;
                 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); border-radius: 25px;}
        </style>
    </head>
    <body style="background-color:powderblue;">
        <div class="dashboard">
            <h1 align="center">Bug Tracker.</h1>
            <form>
                <button class="btn btn-success" type="button" name="BackToDash" value="< Go Back to Admin Dashboard" onclick="location.href='AdminDash.jsp';">< Go Back to Admin Dashboard</button>
            </form>
            <h2 align="center">Resolve Bug Report</h2><hr>

            <%
                HttpSession UserSession = request.getSession(false);
                String username = (String)UserSession.getAttribute("user");
                // out.println("hello, " + username);
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/encrypteddb", "app", "app");
                PreparedStatement ps = c.prepareStatement("select * from TICKETS where TICK_STATE='unresolved'");
                // ps.setString(1, EncDec.RFencrypt(username));
                
                // Code if the user tries to access this page through URL
                if(UserSession.getAttribute("user") == null)
                {
                    response.sendRedirect("LoginPage.html");
                }
            %>

            <form action="ResolutionAdmin.jsp" method="post">
                <h3>Select Bugs to be resolved:</h3>
                <%
                    ResultSet rs = ps.executeQuery();
                    int BugCount = 1;
                    while (rs.next())
                    {
                        String name = rs.getString(1);
                        String title = rs.getString(2);
                        out.println("<div class='form-check'><input type='checkbox' class='form-check-input' name='bugs' id='bug" + BugCount + "' value='" + EncDec.SCdecrypt(title) +"'><label class='form-check-label' for='bug" + BugCount + "'>" + EncDec.RFdecrypt(name) + " - " + EncDec.SCdecrypt(title) + "</label></div><br>");
                        BugCount++;
                    }
                    %><br>
                <input class="btn btn-success" type="submit" name="Resolution" value="Resolve">
            </form><br><br>
        </div>
    </body>
</html>
