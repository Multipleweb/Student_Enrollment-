<%-- 
    Document   : adminLogin
    Created on : Nov 12, 2023, 11:15:16 AM
    Author     : Sian Nun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
    </head>
    <style>
       body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 400px;
            max-width: 100%;
        }

        .tab-content {
            padding: 20px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            font-family: serif;
        }

        .input-group input {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            outline: none;
            border: 1px solid green;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .btn {
            width: 100px;
            height: 40px;
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .admin-log{
            font-size: 20px;
            font-family: serif;
            font-weight: bold;
            color: blue;
        }
        .admin-btn{
            display: flex;
            justify-content: space-between;
        }
        .btn-back{
            background-color: red;
        }
        .btn-back a{
            text-decoration: none;
            color: white;
        }
    </style>
    <body>
        <div class="container">
            <center><h2 class="admin-log">Login As Admin</h2></center>
            
            <div class="tab-content" id="login-tab">
                <form action="logadmin.jsp" method="post">
                    <div class="input-group">
                        <label for="login-username">Username:</label>
                        <input type="text" id="login-username" name="loginusername" required>
                    </div>
                    <div class="input-group">
                        <label for="login-password">Password:</label>
                        <input type="password" id="login-password" name="loginpassword" required>
                    </div>
                    <div class="admin-btn">
                        <input type="submit" value="login" class="btn"/>
                        <button type="submit" class="btn btn-back"><a href="./index.html">Back</a></button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
