<%-- 
    Document   : dashboard
    Created on : Nov 14, 2023, 7:16:55 PM
    Author     : Sian Nun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body{
            padding: 0px;
            margin: 0px;
        }
        .das-container{
            width: 100%;
            height: 60px;
            background-color: #163370;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .das-img img{
            height: 50px;
        }
        .das-link ul{
            display: flex;
            list-style: none;
            display: flex;
            gap: 15px;
        }
        .das-link ul li a{
            color: white;
            text-decoration: none;
        }
        .das-link ul li a:hover{
            color: #5BAE24;
        }
        .das-logout .logout{
            width: 70px;
            height: 25px;
            outline: none;
            border: none;
            border-radius: 5px;
            background-color: #D73359;
            transition: all 0.5s ease;
        }
        .das-logout .logout a{
            font-family: serif;
            font-weight: bold;
            text-decoration: none;
            color: white;
        }
        .logout:hover{
            transform: scale(1.2);
        }
    </style>
    <body>
        <div class="das-container">
            <div class="das-img">
                <img src="./image/college.png" alt="alt"/>
            </div>
            <div class="das-link">
                <ul>
                    <li><a href="./SRDb.jsp">Student Register</a></li>
                    <li><a href="./EnrollData.jsp">Student Enrollment</a></li>
                    <li><a href="url">Student deadline</a></li>
                </ul>

            </div>
            <div class="das-logout">
                <button class="logout"><a href="./index.html">Log out</a></button>
            </div>
        </div>
    </body>
</html>
