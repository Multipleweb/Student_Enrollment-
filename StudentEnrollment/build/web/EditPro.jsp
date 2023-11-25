<%-- 
    Document   : EditPro
    Created on : Nov 24, 2023, 8:15:18 AM
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
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
        }

        input{
            outline: none;
        }

        input, select {
            padding: 8px;
            margin-top: 5px;
            outline: none;
        }

        button {
            background-color: #4caf50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background-color: #45a049;
        }

    </style>
    <body>
        <div class="container">
            <form action="Update.jsp">
                <h2>Student Enrollment Form</h2>
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
                        String sql = "SELECT * FROM tblenrollment where ID=" + Id;
                        pst = con.prepareStatement(sql);
                        rs = pst.executeQuery(sql);
                        while (rs.next()) {

                %>
                <label for="firstName">StudentID:</label>
                <input type="text" id="id" name="Uid" value="<%= rs.getString("ID")%>">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="Ufname" value="<%= rs.getString("firstname")%>">

                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="Ulname" value="<%= rs.getString("lastname")%>">

                <label for="gender">Gender:</label>
                <select id="gender" name="Ugender" value="<%= rs.getString("Gender")%>">
                    <option value="male">Male</option>
                    <br>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>

                <label for="dob">Date of Enrollment</label>
                <input type="date" id="dob"name="Udob" value="<%= rs.getString("Date_enroll")%>">

                <label for="course">Course:</label>
                <select id="id" name="Ucourse" value="<%= rs.getString("Course")%>">
                    <option value="Information Technology">Information Technology</option>
                    <option value="Cyber security">Cyber security</option>
                    <option value="Machine learnin">Machine learning</option>
                </select>
                <% }%>
                <%
                    } catch (Exception e) {
                        out.println("<h2>Error connecting to the database: " + e.getMessage() + "</h2>");
                    }
                %>
                <button type="submit">Update</button>
            </form>
    </body>
</html>
