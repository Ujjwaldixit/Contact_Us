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
        <link rel="stylesheet" type="text/css" href="CSS/style.css">    
    </head>
    <body>

        <div class="form">
            <form action="Login" method="post">
                <div class="form-header">
                    <h1>Login Page</h1>
                </div>
                <label>Login Id</label>
                <br>
                <input type="text" name="login_id" required>
                <br>
                <label>Password</label>
                <br>
                <input type="password" name="password" required>
                <br>
                <button type="submit">Submit</button>
            </form>
        </div>

    </body>
</html>
