/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Airline;

import java.awt.print.Book;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kanchana
 */
public class msg_class {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/airline_reservation_system";
        String user = "root";
        String pw = "";
        Statement st =null;
        ResultSet rs = null;
        Connection con = null;
    public void chat_insert(String name,String msg){    
        
        connectdb();
        try{
            String query = "INSERT INTO customer_chat(name,chat)VALUES('"+name+"','"+msg+"');";  
            st.executeUpdate(query); 
            
            con.close();
            st.close();
        }
        catch(SQLException ex){
            ex.printStackTrace();   
            }
    }
    public void chat_session_close(){
        connectdb();
       try{
            String query = "DELETE FROM customer_chat;";  
            st.executeUpdate(query); 
            
            con.close();
            st.close();
        }
        catch(SQLException ex){
            ex.printStackTrace();   
            }
    
    }
    
    
    public void connectdb(){
    
        
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(url,user,pw);
            st = con.createStatement();
       
        }catch(ClassNotFoundException ex){
             Logger.getLogger(Book.class.getName()).log(Level.SEVERE,null,ex);
         }
        catch( SQLException ex){
           Logger.getLogger(Book.class.getName()).log(Level.SEVERE,null,ex);
        }
    
    
    
    
    
    
    
    
    
    
    }
}
