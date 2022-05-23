<%-- 
    Document   : mybookings
    Created on : May 7, 2022, 11:58:07 PM
    Author     : kanchana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
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
    </head>
	
<body>
 <%  
            String id = null;
            String name = null;
           String kk = null;
           Cookie ck[] = request.getCookies();   
         if(ck != null) {    
            for(int i=0;i<ck.length;i++){
            kk = ck[i].getName();
            if(kk.equals("user")){
            name = ck[i].getValue();       
             }
            if(kk.equals("id")){
            id = ck[i].getValue();       
             } 
        }
     }else{
           name = "login";
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
        <li class="nav-item">
            <a class="nav-link" aria-current="page" href="login/home.jsp">&nbsp;&nbsp;Home&nbsp;&nbsp;</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="login/login_search.jsp">&nbsp;Search & Book&nbsp;</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="#">&nbsp;&nbsp;Contact&nbsp;&nbsp;</a>
        </li>
        
      </ul>
      <span class="navbar-text">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
          <a class="btn btn-primary " href="login_dashboard.jsp">&nbsp;Dashboard&nbsp;</a>
        </li>&nbsp;&nbsp;&nbsp;&nbsp;
        <li class="nav-item">
         <button type="button" class="btn btn-success"><img src="${pageContext.request.contextPath}/sources/user.svg" width="15px" height="15px"/>&nbsp;Hi,&nbsp;&nbsp;<% out.println(name);%>&nbsp;&nbsp;&nbsp;</button>       </li>
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
            
            <h1 class="display-6">My Bookings</h1>
            <form action="bookingdelete" method="post" onsubmit="return confirm('Are you sure want to delete this booking ?')">
            <table border="1" class="table table-hover">
               
                <tr>
                    <th>Booking ID</th>
                    <th>User ID</th>
                    <th>Contact No</th>
                    <th>Route Id</th>
                    <th>Class</th>
                    <th>No of Passengers</th>
                    <th>Fare</th>
                    <th></th>
                </tr>
                <%
                  try{
                                  
                      con = DriverManager.getConnection(url,user,pw);
                      st = con.createStatement();
                      rs =st.executeQuery("SELECT * FROM booking_details WHERE (User_ID='"+id+"');");
                      while(rs.next()){                          
                %>
                <tr class="table-info">
                    <td><%=rs.getString("booking_id")%></td>
                     <td><%=rs.getString("user_id")%></td>
                      <td><%=rs.getString("contact")%></td>
                       <td><%=rs.getString("flight_id")%></td>
                        <td><%=rs.getString("class")%></td>
                         <td><%=rs.getString("passengers")%></td>
                          <td><%=rs.getString("price")%></td>
                          <td><button type="submit" class="btn btn-outline-danger" name="bt" value="<%=rs.getString("booking_id")%>"><img src="sources/close.svg" width="20px" height="20px"/></button></td>

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
        </form>
        <div class="logbutton">
            <a href="ticket_print.jsp"><button type="button" class="btn btn-outline-info">Download Digital Ticket</button></a>
            <a href="login_dashboard.jsp"><button type="button" class="btn btn-warning">Return to Dashboard</button></a>
        </div>
                
 </div>    



  <footer class="footer-01">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
						<h2 class="footer-heading">Colorlib</h2>
						<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
						<ul class="ftco-footer-social p-0">
              <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><span class="ion-logo-twitter"></span></a></li>
              <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><span class="ion-logo-facebook"></span></a></li>
              <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><span class="ion-logo-instagram"></span></a></li>
            </ul>
					</div>
					<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
						<h2 class="footer-heading">Latest News</h2>
						<div class="block-21 mb-4 d-flex">
              <a class="img mr-4 rounded" style="background-image: url(images/image_1.jpg);"></a>
              <div class="text">
                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                <div class="meta">
                  <div><a href="#"><span class="icon-calendar"></span> Oct. 16, 2019</a></div>
                  <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                  <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                </div>
              </div>
            </div>
            <div class="block-21 mb-4 d-flex">
              <a class="img mr-4 rounded" style="background-image: url(images/image_2.jpg);"></a>
              <div class="text">
                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                <div class="meta">
                  <div><a href="#"><span class="icon-calendar"></span> Oct. 16, 2019</a></div>
                  <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                  <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                </div>
              </div>
            </div>
					</div>
					<div class="col-md-6 col-lg-3 pl-lg-5 mb-4 mb-md-0">
						<h2 class="footer-heading">Quick Links</h2>
						<ul class="list-unstyled">
              <li><a href="#" class="py-2 d-block">Home</a></li>
              <li><a href="#" class="py-2 d-block">About</a></li>
              <li><a href="#" class="py-2 d-block">Services</a></li>
              <li><a href="#" class="py-2 d-block">Works</a></li>
              <li><a href="#" class="py-2 d-block">Blog</a></li>
              <li><a href="#" class="py-2 d-block">Contact</a></li>
            </ul>
					</div>
					<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
						<h2 class="footer-heading">Have a Questions?</h2>
						<div class="block-23 mb-3">
              <ul>
                <li><span class="icon ion-ios-pin"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                <li><a href="#"><span class="icon ion-ios-call"></span><span class="text">+2 392 3929 210</span></a></li>
                <li><a href="#"><span class="icon ion-ios-send"></span><span class="text">info@yourdomain.com</span></a></li>
              </ul>
            </div>
					</div>
				</div>
				<div class="row mt-5">
          <div class="col-md-12 text-center">

            <p class="copyright"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ion-ios-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
			</div>
		</footer>
	

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
      
   
    </body>
</html>

