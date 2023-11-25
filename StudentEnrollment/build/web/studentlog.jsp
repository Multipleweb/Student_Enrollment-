<%-- 
    Document   : studentlog
    Created on : Nov 23, 2023, 5:37:10 PM
    Author     : Sian Nun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String dburl = "jdbc:mysql://localhost:3306/sudentenrollment";
        String dbUser = "root";
        String dbPassword = "";
        String username = request.getParameter("uname");
        String password = request.getParameter("psw");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            Connection connection = DriverManager.getConnection(dburl, dbUser, dbPassword);
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT studentName,Password FROM tblregister");

            while (rs.next()) {
                String user = rs.getString(1);
                String pass = rs.getString(2);
                if (user.equals(username) && pass.equals(password)) {
                    out.println("Login Success");
                    response.sendRedirect("Home.html");
                } else {
                    out.println("Login Failed");
                }
            }
        } catch (Exception e) {
            out.println("<h2>Error connecting to the database: " + e.getMessage() + "</h2>");
        }
    %>
    </body>
</html>
