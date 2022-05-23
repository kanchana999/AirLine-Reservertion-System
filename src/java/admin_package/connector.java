/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package admin_package;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author kanchana
 */
public class connector {
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/airline_reservation_system";
    String user = "root";
     String pw = "";
    Connection con=null;
    Statement st= null;
    ResultSet rs =null;
    String pwd =null;
    public String login(String id){
    
        connectdb();
        try{
            con = DriverManager.getConnection(url,user,pw);
            st = con.createStatement();
            rs =st.executeQuery("SELECT * FROM admin_details WHERE (admin_id='"+id+"');");
            while(rs.next()){
                pwd = rs.getString("admin_password");
                return pwd;
            }
           con.close();
           st.close();
        }
    catch(SQLException ex){
        ex.printStackTrace();
        
        
    }return "";
 
    }
   public void register(String name,String email,String pwd){
       
       connectdb();
       try{
            con = DriverManager.getConnection(url,user,pw);
            st = con.createStatement();
            st.executeUpdate("INSERT INTO admin_details VALUES(DEFAULT,'"+name+"','"+email+"','"+pwd+"');");
            
       }catch(SQLException ex){
        ex.printStackTrace();    
    }
       
   }
   public int admin_pw_change(String id,String pwd){
       connectdb();
       try{
                st.executeUpdate("UPDATE admin_details SET admin_password='"+pwd+"' WHERE (admin_id='"+id+"');");
                return 1;

        }catch(SQLException ex)
        {
            ex.printStackTrace();
            return 0;
    }
    
   
   
   }

   
    
    
    
    
    
    
    public void connectdb(){
        
        try{
            Class.forName(driver);
        }
        catch(ClassNotFoundException ex){
            ex.printStackTrace();
        
        }
    }
}
