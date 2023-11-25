<%-- 
    Document   : Edelete
    Created on : Nov 24, 2023, 7:04:20 PM
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
            String Id = request.getParameter("id");

            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the database connection
                con = DriverManager.getConnection(dburl, dbUser, dbPassword);
                pst = con.prepareStatement("delete from tblenrollment where ID ="+Id);
                int n = pst.executeUpdate();

                if (n > 0) {
                    response.sendRedirect("EnrollData.jsp");
                } else {
                    out.println("Insert fails");
                }
            } catch (Exception e) {
                out.println("<h2>Error connecting to the database: " + e.getMessage() + "</h2>");
            }
        %>
    </body>
</html>
