<%-- 
    Document   : login
    Created on : 21-Sep-2021, 9:50:25 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="Login" method="post">
            <label>Login Id</label>
            <input type="text" name="login_id">

            <label>Password</label>
            <input type="password" name="password">

            <button type="submit">Submit</button>
        </form>

    </body>
</html>
