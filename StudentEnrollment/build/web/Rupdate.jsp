<%-- 
    Document   : Rupdate
    Created on : Nov 24, 2023, 4:39:59 PM
    Author     : Sian Nun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Update Page</title>
    </head>
    <body>
        <%
            String dburl = "jdbc:mysql://localhost:3306/sudentenrollment";
            String dbUser = "root";
            String dbPassword = "";
            String Id = request.getParameter("RID");
            String Name = request.getParameter("Rname");
            String Gender = request.getParameter("Rgender");
            String Phone = request.getParameter("Rphone");
            String Email = request.getParameter("Remail");
            String password = request.getParameter("Rpass");

            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the database connection
                con = DriverManager.getConnection(dburl, dbUser, dbPassword);
                pst = con.prepareStatement("update tblregister set studentName = ?,Gender =?,phoneNumber=?,Emails=?,Password=? where StudentID ="+Id);
                pst.setString(1, Name);
                pst.setString(2, Gender);
                pst.setString(3, Phone);
                pst.setString(4, Email);
                pst.setString(5, password);
                int n = pst.executeUpdate();

                if (n > 0) {
                    response.sendRedirect("SRDb.jsp");
                } else {
                    out.println("Insert fails");
                }
            } catch (Exception e) {
                out.println("<h2>Error connecting to the database: " + e.getMessage() + "</h2>");
            }
        %>
    </body>
</html>
