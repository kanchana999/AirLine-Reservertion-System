<%-- 
    Document   : admin_dashboard
    Created on : May 23, 2022, 8:52:22 PM
    Author     : kanchana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.SQLException" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<%@page import="jakarta.servlet.http.Cookie"%> 
<html>
    <head>
        <title>dashboard</title>
         <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/sources/search.css">
        <script src="${pageContext.request.contextPath}/sources/myscripts.js"></script>
        
        <!--bootstrap for nav bar                 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--  nav bar end             --->
        
        <!-- Bootstrap for footer --> 
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/sources/footer/bootstrap-footer-11/css/ionicons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/sources/footer/bootstrap-footer-11/css/style.css">
    <!-- bootstrap end -->
       <script type="text/javascript">
function fun(){
  document.getElementById("myb").click();           
  }  
           
           
function myFunction() {
    
  var x = document.getElementById("myDIV");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
function check(){
    var userpw = document.getElementById ("com_pw");
    var cpw = document.getElementById ( "inputPasswordOld" );
     var newpw = document.getElementById ( "inputPasswordNew" );
    var newconfirmpw = document.getElementById ( "inputPasswordNewVerify" );
    
    if((newpw != "") && (newcomfirmpw != "")){
    if(newpw != newconfirmpw){
        
        alert("New passwords not similar ! please recheck.");
    }
}
}
</script>
    </head>
	
   <body onload="fun()">
 <%  
          String kk =null;
          String id =null;
          Cookie ck[] = request.getCookies();
          if(ck != null){
            for(int i=0;i<ck.length;i++)
            {
                kk = ck[i].getName();
                if(kk.equals("admin_id")){
                        id = ck[i].getValue();
                }
            }
     
     }
         
        %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.html"><img src="${pageContext.request.contextPath}/sources/air logo.png" alt="" width="250" height="60"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        
       
      </ul>
      <span class="navbar-text">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
          <a class="btn btn-primary " href="login_dashboard.jsp">&nbsp;Dashboard&nbsp;</a>
        </li>&nbsp;&nbsp;&nbsp;&nbsp;
        <li class="nav-item">
         <button type="button" class="btn btn-success">&nbsp;<img src="${pageContext.request.contextPath}/sources/user.svg" width="15px" height="15px"/>&nbsp;&nbsp;Admin ID : &nbsp;&nbsp;<% out.println(id);%>&nbsp;</button>       </li>
        </ul>
      </span>
    </div>
  </div>
</nav>         
 <div class="content-box"> 
<hr>

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
            
            <h1 class="display-6">Admin Dashboard</h1>
            <form action="bookingdelete" method="post" onsubmit="return confirm('Are you sure want to delete this booking ?')">
            <table border="1" class="table table-bordered">
               
                <tr>
                    <th>Admin id</th>
                    <th>Admin name</th>
                    <th>Admin email</th>
                    <th>Admin password</th>
                </tr>
                <%
                  try{
                                  
                      con = DriverManager.getConnection(url,user,pw);
                      st = con.createStatement();
                      rs =st.executeQuery("SELECT * FROM admin_details WHERE (admin_id='"+id+"');");
                      while(rs.next()){                          
                %>
                <tr class="table-info">
                    <td><%=rs.getString("admin_id")%></td>
                     <td><%=rs.getString("admin_name")%></td>
                      <td><%=rs.getString("admin_email")%></td>
                       <td class="hidetext"><%=rs.getString("admin_password")%></td>
                        
                </tr>
                <% 
                    }

                    con.close();
                 
                }catch(SQLException ex)
                    {
                        ex.printStackTrace();
                    }

                    
                %>
               
            </table>
            </form><br><hr>
                
                <div class="list-group" style="width:45%;margin-left: 10px">
      <a href="#" class="btn btn-outline-primary list-group-item  active" aria-current="true">Admin dashboard</a>
     <a href="mybookings.jsp" class="btn btn-outline-primary list-group-item ">Staff inquire</a>
     <a href="adminpanel_customer_inquire.jsp" class="btn btn-outline-primary list-group-item ">Customer inquire</a>
     <a href="login/login_search.jsp" class="btn btn-outline-primary list-group-item ">Flight inquire</a>
      <button id="myb" class="btn btn-outline-primary list-group-item " onclick="myFunction()">Change Password</button>
      <a href="admin_logout" class="btn btn-outline-danger list-group-item  ">Log out</a>
</div>
  
<div class="list-group" style="width:45%;float: right;margin-top:-250px;margin-right:40px;">
    <div  class="card card-outline-secondary" id="myDIV" style="min-height:100px">
                        <div class="card-header">
                            <h3 class="mb-0">Change Password</h3>
                        </div>
                        <div class="card-body">
                            <form class="form" role="form" autocomplete="off" action="admin_pw_change" method="post">
                                <div class="form-group">
                                    <label for="inputPasswordOld">Current Password</label>
                                    <input type="text" value="<% out.println(id) ;%>" name="admin_id" hidden/>
                                    <input type="password" name="cpw" class="form-control" id="inputPasswordOld" required="">
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNew">New Password</label>
                                    <input type="password" name="npw" class="form-control" id="inputPasswordNew" required="">
                                    <span class="form-text small text-muted">
                                            The password must be 8-20 characters, and must <em>not</em> contain spaces.
                                        </span>
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNewVerify">Verify</label>
                                    <input type="password" name="cnpw" class="form-control" id="inputPasswordNewVerify" required="">
                                    <span class="form-text small text-muted">
                                            To confirm, type the new password again.
                                        </span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" onclick="check()" class="btn btn-success btn-lg float-right">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>












 </div>           
    
        
    </body>
</html>
