<%-- 
    Document   : enrollInsert
    Created on : Nov 23, 2023, 7:48:23 PM
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
            String fName = request.getParameter("fname");
            String lName = request.getParameter("lname");
            String Gender = request.getParameter("gender");
            String Date_of_enroll = request.getParameter("dob");
            String Course = request.getParameter("course");

            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the database connection
                con = DriverManager.getConnection(dburl, dbUser, dbPassword);
                pst = con.prepareStatement("insert into tblenrollment values(?,?,?,?,?,?)");
                pst.setString(1, Id);
                pst.setString(2, fName);
                pst.setString(3, lName);
                pst.setString(4, Gender);
                pst.setString(5, Date_of_enroll);
                pst.setString(6, Course);
                int n = pst.executeUpdate();
                if (n > 0) {
                    response.sendRedirect("Home.html");
                } else {
                    out.println("Insert fails");
                }
            } catch (Exception e) {
                out.println("<h2>Error connecting to the database: " + e.getMessage() + "</h2>");
            }
        %>
    </body>
</html>
