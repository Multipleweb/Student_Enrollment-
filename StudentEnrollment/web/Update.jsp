<%-- 
    Document   : Update
    Created on : Nov 24, 2023, 4:10:30 PM
    Author     : Sian Nun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
        <%
            String dburl = "jdbc:mysql://localhost:3306/sudentenrollment";
            String dbUser = "root";
            String dbPassword = "";
            String Id = request.getParameter("Uid");
            String FirstName = request.getParameter("Ufname");
            String LastName = request.getParameter("Ulname");
            String Gender = request.getParameter("Ugender");
            String Date = request.getParameter("Udob");
            String Course = request.getParameter("Ucourse");

            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the database connection
                con = DriverManager.getConnection(dburl, dbUser, dbPassword);
                pst = con.prepareStatement("update tblenrollment set firstname = ?,lastname =?,Gender=?,Date_enroll=?,Course=? where ID ="+Id);
                pst.setString(1, FirstName);
                pst.setString(2, LastName);
                pst.setString(3, Gender);
                pst.setString(4, Date);
                pst.setString(5, Course);
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
