<%-- 
    Document   : Registerhome.jsp
    Created on : Apr 25, 2021, 1:45:49 PM
    Author     : Hari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Control</title>
        <style>
            .House h1{
                font-size: 25px;
                color: #4b0082;
            }
            .House input[type=text]{
                width: 250px;
                height: 30px;
                padding: 5px;
            }
        </style>
    </head>
    <body>
    <center>
        <div class="House">
        <h1>House Registration</h1>
        <form action="Homeadd" method="POST" enctype="multipart/form-data">
            Name of the Owner: <input type="text" name="name" placeholder="Owner Name.." required/>
            <br>
            <br>
            Phone Number: <input type="text" name="phoneno" placeholder="Phone Number" required/>
            <br>
            <br>
            Villa Name: <input type="text" name="hname" placeholder="Villa Name.." required/>
            <br>
            <br>
            House Address:<textarea name="address" placeholder="Address" required></textarea>
            <br>
            <br>
            House Specification: <textarea name="hspec" placeholder="House Specification" required=""></textarea>
            <br>
            <br>
            Rent per Month: <input type="text" name="rpm" placeholder="Rent Per Month" required/>
            <br>
            <br>
            House picture: <input type="file" name="photo" required/>
            <br>
            <br>
            <input type="submit" value="Add your Home" />
        </form>
        </div>
    </center>
    </body>
</html>
