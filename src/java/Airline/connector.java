/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Airline;

import java.sql.Statement;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kanchana
 */
public class connector {
    
    private String driver = "com.mysql.jdbc.Driver" ;
    private String url = "jdbc:mysql//localhost:3306/air_line_db";
    Statement st;
    
    
    private void search_Data(String airport,String dest){
        connect_db();
        String quary = "Select * from ";
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private void connect_db(){
        try{
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url,"root","");
            st = con.createStatement();
        }
        catch(ClassNotFoundException | SQLException ex){
            Logger.getLogger(connector.class.getName()).log(Level.SEVERE,null,ex);
        }
    
    }
}
