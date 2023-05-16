
<%@page import="p1.EncDec"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Dashboard</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <style>
            .dashboard {margin-left: 7%; margin-right: 7%; background-color: white; padding-left: 25px; padding-right: 25px;
                 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); border-radius: 25px;}
        </style>
    </head>
    <body style="background-color:powderblue;">
        <div class="dashboard">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                <a class="navbar-brand">Bug Tracker.</a>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="CreateReport.jsp">Create Report</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ResolveBugs.jsp">Resolve Reports</a>
                    </li>
                    <!-- <li class="nav-item">
                        <a class="nav-link" href="DeleteBugs.jsp">Delete Reports</a>
                    </li> -->
                </ul>
                <form class="d-flex">
                    <button class="btn btn-outline-danger" type="button" value="LOG OUT" name="logout" onclick="location.href='Logout.jsp';">Log Out</button>
                </form>
            </div>
            </nav>
            
            
        <%
            
            // Creating a user session
            HttpSession UserSession = request.getSession(false);
            String username = (String)UserSession.getAttribute("user");
            
            out.println("<h1>Welcome, " + username + "</h1>");
            out.println("<hr>");
            
            // To display list of unresolved bugs (tickets)
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/encrypteddb", "app", "app");
            PreparedStatement ps = c.prepareStatement("select * from TICKETS where TICK_USER=? and TICK_STATE='unresolved'");
            ps.setString(1, EncDec.RFencrypt(username));
            out.println("<br><br><h2><u>Reported Bugs</u></h2>");
            ResultSet rs = ps.executeQuery();   // Table to display bugs V
            out.println("<table class='table'><thead class='table-dark'><th>Sr</th><th>Title</th><th>Description</th></thead><tbody>");
            int BugCount = 1;
            while (rs.next()) 
            {
                // String s1 = rs.getString(1);
                String title = rs.getString(2);
                String desc = rs.getString(3);
                out.println("<tr><td>" + BugCount + "</td><td>" + EncDec.SCdecrypt(title) + "</td><td>" + EncDec.SCdecrypt(desc) + "</td></tr>");
                BugCount += 1;
            }
            out.println("</tbody></table><br><br><hr>");    // End of table

            // RESOLVED BUGS
            out.println("<h2><u>Resolved Bugs</u></h2>");
            PreparedStatement ps1 = c.prepareStatement("select * from TICKETS where TICK_USER=? and TICK_STATE='resolved'");
            ps1.setString(1, EncDec.RFencrypt(username));
            ResultSet rs1 = ps1.executeQuery();
            out.println("<table class='table'><thead class='table-dark'><th>Sr</th><th>Title</th><th>Description</th></thead><tbody>");
            int UnBugCount = 1;
            while (rs1.next())
            {
                String title = rs1.getString(2);
                String desc = rs1.getString(3);
                out.println("<tr><td>" + UnBugCount + "</td><td>" + EncDec.SCdecrypt(title) + "</td><td>" + EncDec.SCdecrypt(desc) + "</td></tr>");
                UnBugCount += 1;
            }
            out.println("</tbody></table><br><br><hr>");
            
            // Code if the user tries to access this page through URL
            if(UserSession.getAttribute("user") == null)
            {
                response.sendRedirect("LoginPage.html");
            }
        %>
        </div>
    </body>
</html>
