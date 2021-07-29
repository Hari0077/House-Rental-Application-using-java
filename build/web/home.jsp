<%-- 
    Document   : home
    Created on : Apr 12, 2021, 10:42:10 PM
    Author     : Hari
--%>

<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>House Rentals</title>
        <style>
            
            .Nav{
                top: 0;
                left: 0;
                width: 230px;
                background-color: lightblue;
                position: fixed;
                height:100%;
                font-size: 25px;
                padding: 20px;
                margin-bottom: 4px;
            }
            .tablehouse{
                margin-left: 300px;
            }
            .tablehouse h1{
                text-align: center;
                margin-left: 25px;
                margin-right: 25px;
                font-size: 25px;
            }
            .tablehouse table{
                margin-left: 140px;
            }
            a{
                text-decoration: none;
            }
            a:hover{
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        
        <div class="Nav">
        <%
            
             String n=(String)session.getAttribute("email");
             out.println("Welcome");
             out.println("<br>");
             out.println("<br>");
             out.println("<br>");
             out.println(n);
             out.println("<br>");
             out.println("<br>");
        %>
        <a href="home.jsp">Home</a>
        <br><br>
        <a href="yourhome">your Home</a>
        <br><br>
        <a href="Logout">Logout</a>
        </div>
        <div class="tablehouse">
        <%
             Blob image = null;
            Connection con = null;
             byte[] imgData = null ;
            Statement stmt = null;
            ResultSet rs = null;
          
            
                  

                try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentalapp","root","");
                stmt = con.createStatement();
                rs = stmt.executeQuery("select * from availablehomes");
                out.println("<h1>Available Homes</h1>");
                out.println("<table border='2'>");
                out.println("<tr>");
                out.println("<th>Owner name</th>");
                out.println("<th>Phone no</th>");
                out.println("<th>Address</th>");
                out.println("<th>Villa Name</th>");
                out.println("<th>Home Specification</th>");
                out.println("<th>Rent Per Month</th>");
                out.println("<th>Image</th>");
                out.println("<th>Book</th>");
                out.println("</tr>");
               // out.println("<th>picture</th>");
                while(rs.next()) {
                    
//                   image = rs.getBlob(7);
//                   imgData = image.getBytes(1,(int)image.length());
                    String i = rs.getString("phoneno");
                    out.println("<tr>");
                    out.println("<td>"+ rs.getString(1) +"</td>");
                    out.println("<td>"+ rs.getString(2) +"</td>");
                    out.println("<td>"+ rs.getString(3) +"</td>");
                    out.println("<td>"+ rs.getString(4) +"</td>");
                    out.println("<td>"+ rs.getString(5) +"</td>");
                    out.println("<td>"+ rs.getString(6) +"</td>");
                   byte[] bytearray = new byte[1048576];
                   int size=0;
                   image = rs.getBlob(7);
                   imgData = image.getBytes(1,(int)image.length());


                   Base64.Encoder encoder = Base64.getEncoder();
                  
                   String encoding = "data:image/jpg;base64," + encoder.encodeToString(imgData);

                    out.println("<td>");
                        out.println("<img src='" + encoding +"' alt=\"\" height=\"70\" width=\"70\">");

                    out.println("</td>");
                      out.println("<td>"+ "<a href='Bookhome?id="+ i +"'> Book your house </a>"+ "</td>");
                    out.println("</tr>");
                                   
                }
                out.println("</table>");
                // display the image
             
                } catch (Exception e) {
                out.println("Unable To Display image");
                out.println("Image Display Error=" + e.getMessage());
                
                } 





         %>
        </div>

    </body>
</html>
