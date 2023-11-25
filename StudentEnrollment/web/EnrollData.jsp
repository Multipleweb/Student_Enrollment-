<%-- 
    Document   : EnrollData
    Created on : Nov 14, 2023, 8:54:08 PM
    Author     : Sian Nun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DESHBOARD</title>
    </head>
    <style>
        table {
            border-collapse: collapse;
            margin-top: 10px;

        }
        .show-table{
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        th, td{
            padding: 10px;
        }
        .head-table{
            width: 100%;
            margin-top: 20px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .input-search .search{
            width: 300px;
            height: 30px;
            border: none;
            border: 2px solid green;
            outline: none;
            padding: 0px 0px 0px 5px;
        }
        .btn-search{
            width: 100px;
            height: 30px;
            outline: none;
            border: none;
            color: white ;
            border-radius: 5px;
            background-color: navy;
            font-weight: bold;
            font-family: serif;
            cursor: pointer;

        }
        .table-title{
            width: 150px;
            height: 30px;
            background-color: darkblue;
            display: grid;
            place-items: center;
            color: white;
        }
        .btn{
            width: 70px;
            height: 25px;
            outline: none;
            border: none;
            border-radius: 5px;
            background-color: midnightblue;
            cursor: pointer;
            color: white;
        }
        .btn a{
            text-decoration: none;
            color: white !important;
        }
        .delete{
            background-color: red;
        }
    </style>

    <body>
        <div>
            <%@include file="./dashboard.jsp" %>
        </div>
        <div class="show-table">
            <div class="head-table">
                <div class="table-title">
                    Enrollment Data 
                </div>
                <div class="input-search">
                    <input type="search" placeholder="Search by name or id...." class="search">
                    <input type="submit" value="Search" class="btn-search">
                </div>
            </div>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Gender</th>
                    <th>Date of Enrollment</th>
                    <th>Course</th>
                    <th>Action</th>
                </tr>
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
                        String sql = "SELECT * FROM tblenrollment";
                        Statement st = con.createStatement();
                        rs = st.executeQuery(sql);
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("ID")%></td>
                    <td><%= rs.getString("firstName")%></td>
                    <td><%= rs.getString("lastname")%></td>
                    <td><%= rs.getString("Gender")%></td>
                    <td><%= rs.getString("Date_enroll")%></td>
                    <td><%= rs.getString("course")%></td>
                    <td>
                        <button class="btn"><a href="EditPro.jsp?id=<%= rs.getString("ID")%>">Edit</a></button>
                        <button class="btn delete"><a href="Edelete.jsp?id=<%=rs.getString("ID")%>">Delete</a></button>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<h2>Error connecting to the database: " + e.getMessage() + "</h2>");
                    }
                %>
            </table>
        </div>
    </body>

</html>
