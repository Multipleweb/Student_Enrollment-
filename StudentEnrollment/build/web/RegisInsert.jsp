<%-- 
    Document   : RegisInsert
    Created on : Nov 22, 2023, 3:49:53 PM
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
            String Id = request.getParameter("txtID");
            String studentName = request.getParameter("txtname");
            String Gender = request.getParameter("txtgender");
            String Phone = request.getParameter("txtphone");
            String Email = request.getParameter("txtemail");
            String Password = request.getParameter("txtpass");

            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the database connection
                con = DriverManager.getConnection(dburl, dbUser, dbPassword);
                pst = con.prepareStatement("insert into tblregister values(?,?,?,?,?,?)");
                pst.setString(1, Id);
                pst.setString(2, studentName);
                pst.setString(3, Gender);
                pst.setString(4, Phone);
                pst.setString(5, Email);
                pst.setString(6, Password);
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
