/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Airline;

import java.awt.print.Book;
import java.sql.Statement;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLException;
import jakarta.servlet.http.Cookie;
/**
 *
 * @author kanchana
 */
public class connector{

    String driver = "com.mysql.jdbc.Driver";
    String url ="jdbc:mysql://localhost:3306/air_line_db";
    String user = "root";
    String pw = "";
    Statement st;
    Connection con;
    ResultSet rs;
    String password;
    int uid;
    int total_fare;
    String temp;
    public String select(String inquary){
        
        connectdb();
        
        try{
            
            String quary = "SELECT user_password FROM users WHERE (user_name='"+inquary+"')";
            rs = st.executeQuery(quary);
        
            while(rs.next()){
                password = rs.getString(1);  
            }
            con.close();
           st.close();
            return password;
            
            }
        catch(SQLException ex){
             ex.getMessage();
             return "";
        }
    }
    public void booking(int uid,int tp,int rid,String c,int ps,int price){
        connectdb();
        try{
            String query = "INSERT INTO booking VALUES(default,'"+uid+"','"+tp+"','"+rid+"','"+c+"','"+ps+"','"+price+"');";
            
            st.executeUpdate(query);
           
           
           con.close();
           st.close();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
    
    
    }
    public void booking_delete(int bid){
        
        String query = "DELETE FROM booking WHERE (booking_id='"+bid+"')";
        connectdb();
        try{
            st.executeUpdate(query);
            con.close();
            st.close();
            
        }catch(SQLException ex){
            ex.printStackTrace();
        
        }
    
    
    }
    public int changepassword(String user,String current_pw,String new_pw,String comfirm_npw){
        connectdb();
        
        try{
                String query = "update users set user_password='"+comfirm_npw+"'where (user_name='"+user+"');";
                st.executeUpdate(query);
                return 1;

        }catch(SQLException ex)
        {
            ex.printStackTrace();

    }
    return 0;
    
}
    
        
     public void connectdb(){
         try{
              Class.forName(driver);
         con = DriverManager.getConnection(url,user,pw);
            st = con.createStatement();
         }
         catch(ClassNotFoundException ex){
             Logger.getLogger(Book.class.getName()).log(Level.SEVERE,null,ex);
         }
        catch( SQLException ex){
           Logger.getLogger(Book.class.getName()).log(Level.SEVERE,null,ex);
        }
     }
     
     public int getuserid(String inquary){
         connectdb();
         try{
            
            String quary = "SELECT user_id FROM users WHERE (user_name='"+inquary+"')";
            rs = st.executeQuery(quary);
        
            while(rs.next()){
                uid =Integer.parseInt(rs.getString("user_id"));  
            }
            con.close();
           st.close();
            return uid;
            
            }
        catch(SQLException ex){
             ex.getMessage();
             return 0;
        }
        
     }
     public int pricecalculator(String cls,int passengers){
            if(cls == "First Class"){
                total_fare = 300000*passengers;
                return total_fare;
            }
            else if(cls.equals("Business class")){
                total_fare = 250000*passengers;
                return total_fare;
            }
            else{
                total_fare = 150000*passengers;
                return total_fare;
            }
         }
               
 }   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 

