<%-- 
    Document   : chatbox
    Created on : May 22, 2022, 10:47:03 PM
    Author     : kanchana
--%>
<%@ page import="java.io.*,java.util.*" %>
<%@page import="java.sql.SQLException" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<%@page import="jakarta.servlet.http.Cookie"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/sources/contact.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <title>Customer support</title>
        <script>
<!--
function timedRefresh(timeoutPeriod) {
	setTimeout("location.reload(true);",timeoutPeriod);
}

window.onload = timedRefresh(10000);

//   -->
</script>
    </head>
    <body>
        <%
            String name =(String) request.getAttribute("client");

            
            %>
         <div class="line-bar">
                    <i><h4>Chat Box 1.0</h4></i>
         </div><br> 
            
        
        <div class="content-box1">        
                    <div class="chat-box">    
                        <% 
               
                String driver = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/";
                String db="airline_reservation_system";
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
            <table border="1" class="table">
               
                
                <%
                  try{
                      
                      con = DriverManager.getConnection(url+db,user,pw);
                      st = con.createStatement();
                      rs =st.executeQuery("SELECT * FROM customer_chat;");
                     
                      while(rs.next()){                          
                %>
                <tr class="table-hover">
                    <td style="width:20%;">
                        <%=rs.getString("name")%>&nbsp; >></td>
                    <td>
                         <%=rs.getString("chat")%></td>
                </tr>
                <% 
                    }
                     
                 
                }catch(SQLException ex)
                    {
                        ex.printStackTrace();
                    }
                    
                   
                    
                %>
               
            </table>    
                    </div>   
            </div>
             <div class="send-msg ">
            
             <form class="form-inline"action="msg_box"  method="post" >
            <div class="form-group mx-sm-3 mb-2">
                <input type="text" name="name" value="<% out.println(name);%>" hidden/>
                <input type="text" name="msg" class="form-control" id="inputPassword2" placeholder="type message here">
            </div>
                <button style="margin-left:10px" type="submit" class="btn btn-primary">&nbsp;&nbsp;send&nbsp;&nbsp;</button>
                
             </form> 
                
</div> 
            
    </body>
</html>
