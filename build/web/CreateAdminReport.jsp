
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a Bug Report</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <style>
            .mainpage {margin-left: 7%; margin-right: 7%; background-color: white; padding-left: 75px; padding-right: 75px;
                 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); border-radius: 25px;}
        </style>
    </head>
    <body style="background-color:powderblue;">
        <div class="mainpage">
            <h1 align="center">Bug Tracker.</h1>
            <form>
                <input class="btn btn-success" type="button" name="BackToDash" value="< Go Back to Admin Dashboard" onclick="location.href='AdminDash.jsp';">
            </form>
            <h2 align="center">Create Bug Report</h2><hr>
            <form action="SubmitAdminReport.jsp" method="post">
                <div class="mb-3">
                    <label class="form-label">Enter Bug Report Title:</label><br>
                    <input class="form-control" type="text" name="TicketTitle" placeholder="Enter Bug Report Title" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Enter Bug Report Description:</label><br>
                    <textarea class="form-control" rows="3" type="text" name="TicketDesc" placeholder="Enter Bug Report Description"  required></textarea>
                </div>
                <input type="submit" class="btn btn-success" name="SubmitReport" value="Create">
                <br><br>
            </form>
            <%
            HttpSession UserSession = request.getSession(false);
            String username = (String)UserSession.getAttribute("user");
            
            // Code if the user tries to access this page through URL
            if(UserSession.getAttribute("user") == null)
            {
                response.sendRedirect("LoginPage.html");
            }
        %>
        </div>
    </body>
</html>
