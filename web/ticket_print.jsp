<%-- 
    Document   : ticket_print
    Created on : May 21, 2022, 11:01:03 PM
    Author     : kanchana
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<%@page import="jakarta.servlet.http.Cookie"%>         
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.6/jspdf.plugin.autotable.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>   
        <style>
            #lppresults{text-align: left;} 
  table{font-family: arial, sans-serif;   border-collapse: collapse;width:5%;
        font-size:10px;
  }
        td, th, button {  border: 1px solid #dddddd;  
    text-align: left;  
    padding: 8px;  
  }  
      
        
        
        </style>
        
    </head>
    <body>
        <%
        String id = null;
     Cookie ck[] = request.getCookies();
     String kk = null;
     for(int i=0;i<ck.length;i++){
        kk = ck[i].getName();
        if(kk.equals("id")){
            id = ck[i].getValue();
        }
     }    
            
        %>
        
        
        
        
        
        <h1>Your Tickets</h1> <br>
        <div class="survey-results" id="lppresults">

             <img src="sources/air logo.png" width="100px" height="60px"/>      
                  
             <table border="1">
              <tbody>
                <tr>
                    <th>Tikcet_ID</th>
                    <th>User_ID</th>
                    <th>Passenger Name</th>
                 <th>Flight_ID</th>
                    <th>Class</th>
                    <th>Date_available</th>
                    <th>Time_Depart</th>
                    <th>Fare</th>
                    
                </tr>
 <% 
     
     
     String driver = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/airline_reservation_system";
                String user = "root";
                String pw = "";
                try{
                    Class.forName(driver);
                }
                catch(ClassNotFoundException ex){
                    ex.printStackTrace();
                }
                Statement st =null;
                ResultSet rs =null;
                Connection con =null;
            %>
        <%
                  try{
                                  
                      con = DriverManager.getConnection(url,user,pw);
                      st = con.createStatement();
                      rs =st.executeQuery("SELECT * FROM ticket_details WHERE User_ID=001;");
                      while(rs.next()){                          
                %>
      
                <tr>
                    <td><%=rs.getString("Tikcet_ID")%></td>
                     <td><%=rs.getString("User_ID")%></td>
                      <td><%=rs.getString("Name")%></td>
                     <td><%=rs.getString("Flight_ID")%></td>
                        <td><%=rs.getString("class")%></td>
                         <td><%=rs.getString("Date_available")%></td>
                          <td><%=rs.getString("Time_Depart")%></td>
                          <td><%=rs.getString("amount")%></td>
                   
                </tr>
              
                         
                <% 
                    }

                    con.close();
                 
                }catch(SQLException ex)
                    {
                        ex.printStackTrace();
                    }

                    
                %>
         
              </tbody> 
            </table>
                       
              
           </div>   
                <br>
                <button type="button" id="generatereport" class="btn btn-outline-success">Download Ticket</button> 
    
    
    </body>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
    
<script>
     var doc = new jsPDF();
$('#generatereport').click(function() {
   doc.fromHTML($('#lppresults')[0], 15, 15, {
      width: 170
   }, function() {
      doc.save('sample-file.pdf');
   });
});
</script>
    
</html>
 