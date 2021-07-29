
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Hari
 */
@WebServlet("/Homeadd")
@MultipartConfig(maxFileSize = 16177215)

public class Homeadd extends HttpServlet{
    Connection con;
    PreparedStatement pat;
    int row;
    public void doPost(HttpServletRequest req,HttpServletResponse rsp)throws IOException,ServletException
    {
            rsp.setContentType("text/html");
            PrintWriter out = rsp.getWriter();
            
            String ownername = req.getParameter("name");
            String phoneno = req.getParameter("phoneno");
            String villaname = req.getParameter("hname");
            String address = req.getParameter("address");
            String homespec = req.getParameter("hspec");
            String rpm = req.getParameter("rpm");
            
            InputStream inputStream = null;
            
            Part filePart = req.getPart("photo");
                      
            inputStream = filePart.getInputStream();

        try {
             
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/rentalapp", "root", "");
            pat = con.prepareStatement("insert into availablehomes(ownername,phoneno,villaname,address,homespec,rpm,imagehouse)values(?,?,?,?,?,?,?)");
            pat.setString(1,ownername);
            pat.setString(2,phoneno);
            pat.setString(3, villaname);
            pat.setString(4,address);
            pat.setString(5,homespec);
            pat.setString(6,rpm);
            
            if(inputStream != null)
            {  
                 pat.setBlob(7, inputStream);
            }
            
            row = pat.executeUpdate();
            
            
            if(row > 0)
            {
                out.println("Home added successfully");
                out.println("<a href='index.jsp'>Go back!!</a>");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Homeadd.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Homeadd.class.getName()).log(Level.SEVERE, null, ex);
        }
  

    }
}
