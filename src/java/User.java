
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Hari
 */
@WebServlet("/User")
public class User extends HttpServlet{
    Connection con;
    PreparedStatement pat;
    int row;
    public void doPost(HttpServletRequest req,HttpServletResponse rsp)throws IOException,ServletException
    {
        rsp.setContentType("text/html");
        PrintWriter out = rsp.getWriter();
        
        
        String successMessage="";
       try
       {
         String fname = req.getParameter("fname");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        String cpass = req.getParameter("confirm_password");
        
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost/rentalapp", "root", "");
         
         pat = con.prepareStatement("insert into users(name,email,password,cpw)values(?,?,?,?)");
         pat.setString(1,fname);
         pat.setString(2,email);
         pat.setString(3, pass);
         pat.setString(4, cpass);
         row = pat.executeUpdate();
         
         if(row > 0)
         {
             successMessage = "registered successfully please login";
             req.setAttribute("successMessage", successMessage);
             req.getRequestDispatcher("/index.jsp").forward(req, rsp);
              //out.println("user registered");
         }
        
       } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
