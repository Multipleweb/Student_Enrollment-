<%-- 
    Document   : EditRegis
    Created on : Nov 24, 2023, 4:28:58 PM
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
    <style>
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box
    }
    body{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    form{
        margin-top: 40px;
        width: 400px;
        height: 450px;
        background-color: rgb(224, 224, 225);
        padding: 15px;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        gap: 5px;
    }
    input{
        width: 370px;
        height: 30px;
        outline: none;
        border: none;
        border: 2px solid rgb(4, 126, 174);
        padding:0px 0px 0px 5px;
    }
    .res-btn{
        margin-top: 10px;
        display: flex;
        justify-content: space-between;
    }
    .btn-res{
        width: 100px;
        border: none;
        background-color: rgb(11, 11, 162);
        color: white;
        cursor:pointer;
    }
    .btn-back{
        width: 100px;
        height: 30px;
        border: none;
        background-color: red;
    }
    .btn-back a{
        text-decoration: none;
        color: white;
    }
</style>
    <body>
        <form action="Rupdate.jsp" method="post">
            <center><h3>Update Register</h3></center>
            <%
                String dburl = "jdbc:mysql://localhost:3306/sudentenrollment";
                String dbUser = "root";
                String dbPassword = "";
                Connection con;
                PreparedStatement pst;
                ResultSet rs;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish the database connection
                    con = DriverManager.getConnection(dburl, dbUser, dbPassword);
                    // Display a success message
                    String Id = request.getParameter("id");
                    String sql = "SELECT * FROM tblregister where StudentID=" + Id;
                    pst = con.prepareStatement(sql);
                    rs = pst.executeQuery(sql);
                    while (rs.next()) {

            %>
            <label for="text">StudentID</label>
            <input type="text" name="RID" value="<%= rs.getString("studentID") %>">
            <label for="text">Name:</label>
            <input type="text" name="Rname" value="<%= rs.getString("studentname") %>">
            <label for="text">Gender:</label>
            <input type="text" name="Rgender" value="<%= rs.getString("Gender") %>">
            <label for="text">Mobile Phone:</label>
            <input type="text" name="Rphone" value="<%= rs.getString("phoneNumber") %>">
            <label for="text">Email:</label>
            <input type="email" name="Remail" value="<%= rs.getString("Emails") %>">
            <label for="text">Password:</label>
            <input type="password" name="Rpass" value="<%= rs.getString("password") %>">
            <div class="res-btn">
                <input type="submit" value="Update Now" class="btn-res">
                <button class="btn-back">
                    <a href="./index.html">Back</a>
                </button>
            </div>
            <% }%>
            <%
                } catch (Exception e) {
                    out.println("<h2>Error connecting to the database: " + e.getMessage() + "</h2>");
                }
            %>
        </form>
    </body>
</html>
