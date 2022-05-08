<%-- 
    Document   : Search_view
    Created on : May 3, 2022, 1:50:02 PM
    Author     : kanchana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<!DOCTYPE html>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Search Result</title>
         <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="sources/search.css">
        <script src="sources/myscripts.js"></script>
        
        <!--bootstrap for nav bar                 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--  nav bar end             --->
        
        <!-- Bootstrap for footer --> 
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="sources/footer/bootstrap-footer-11/css/ionicons.min.css">
	<link rel="stylesheet" href="sources/footer/bootstrap-footer-11/css/style.css">
    <!-- bootstrao end -->
    
    
	
<body>
    <%
        String name;
       name ="Login";
        %>
        
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.html"><img src="sources/air logo.PNG" alt="" width="250" height="60"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link" aria-current="page" href="index.html">&nbsp;&nbsp;Home&nbsp;&nbsp;</a>
        </li>
        <li class="nav-item">
            <a class="btn btn-primary" href="search.html">&nbsp;&nbsp;Search & Book&nbsp;&nbsp;</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="#">&nbsp;&nbsp;Contact&nbsp;&nbsp;</a>
        </li>
        
      </ul>
      <span class="navbar-text">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link " aria-current="page" href="#">&nbsp;&nbsp;Register&nbsp;&nbsp;    </a>
        </li>
        <li class="nav-item">
           <a class="btn btn-success" aria-current="page" href="login.html"><img src="sources/login.svg" width="15px" height="15px">&nbsp;&nbsp;&nbsp;<% out.println(name); %>&nbsp;</a>
        </li>
        </ul>
      </span>
    </div>
  </div>
</nav>    
    
        
        
        
        
        
        
        
        
        
        

        <div class="content-box">
            <br><!-- comment -->
            <h2>Search Airlines</h2>
            <hr>
           
        
<%
    String quary =(String)request.getAttribute("method");
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/";
            String db = "air_line_db";
            String user = "root";
            String pw = "";
            try{
                Class.forName(driver);
            }
           catch(ClassNotFoundException e) {
                e.printStackTrace();
                }
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>
        <div class="table-responsive-md">
        <table style="color:white;" border="1" class="table">
            <tr class="bg-primary">
                <th>Route ID</th>
                <th>Departing Airport</th>
                <th>Destination Airport</th>
                <th>Date</th>
            </tr>
            <%
                try{
            connection = DriverManager.getConnection(url+db,user,pw);
            statement=connection.createStatement();
            
            String sql =quary;
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
            %>
            <tr class="bg-success">
                <td><%=resultSet.getInt("routeid")%></td>
                <td><%=resultSet.getString("airport")%></td>
                <td><%=resultSet.getString("destination")%></td>
                <td><%=resultSet.getString("date")%></td>
            </tr>
            <%
                }
              connection.close();  
            }catch(Exception ex){
                ex.printStackTrace();
            }   
            %>
        </table>            
        </div>  
        
        
        <div class="logbutton">
            <a href="login.html"><button type="button" onclick="alert('Please log in!')" class="btn btn-outline-info">Book your seat right Now !</button></a>
            <a href="returnservlet"><button type="button" class="btn btn-warning">Return to Search</button></a>
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

