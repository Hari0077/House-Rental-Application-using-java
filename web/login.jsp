<%-- 
    Document   : login
    Created on : Apr 12, 2021, 10:01:27 PM
    Author     : Hari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Login</title>
        <style>
            body{
                background-color: #4b0082;
            }
            form{
                width: 330px;
                padding-top: 20px;
                padding-bottom: 20px;
                padding-left: 20px;
                padding-right: 20px;
                background-color: crimson;
                z-index: -1;
            }
            form input[type=email],input[type=password]{
                width: 280px;
                height: 35px;
                
            }
            form input[type=submit]{
                width: 100px;
                height: 35px;
                background-color: #4b0082;
                color: white;
                border: #4b0082;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
      <center>
        
          <h1 style="color: white;">House Rentals</h1>
          <br>
          <br>
          <h2 style="color: white; font-family: cursive; font-size: 20;">Login to see and book house</h2>
          <br>
          <br>
          <form action="Login">
              <input type="email" name="username" placeholder="Email" required/>
              <br>
              <br>
              <input type="password" name="password" placeholder="Password.." required/>
              <br>
              <br>
              <input type="submit" value="Login">
          </form>
      </center>
    </body>
</html>
