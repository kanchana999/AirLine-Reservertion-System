<%-- 
    Document   : adminpanel_customer_inquire
    Created on : May 23, 2022, 11:22:02 PM
    Author     : kanchana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Search</title>
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
    <!-- bootstrao end -->
    
    </head>
	
<body>
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
          <a class="nav-link " href="login_dashboard.jsp">&nbsp;Dashboard&nbsp;</a>
        </li>&nbsp;&nbsp;&nbsp;&nbsp;
        <li class="nav-item">
         <button type="button" class="btn btn-success">&nbsp;<img src="${pageContext.request.contextPath}/sources/user.svg" width="15px" height="15px"/>&nbsp;&nbsp;Admin ID : &nbsp;&nbsp;<% out.println(id);%>&nbsp;</button>       </li>
        </ul>
      </span>
    </div>
  </div>
</nav>              

        <div class="content-box">
            <br><!-- comment --><hr>
            <h2>Search Customers</h2>
            <hr>
            <div class="form-box">
                <form method="post" action="${pageContext.request.contextPath}/Search">
                <table>
                    <tr>
                        <td>
                            <div class="form-floating">
                                <input type="text" name="customer_id" class="form-select"/>
                            <label for="floatingSelect">Customer ID</label>
                        </div>
                        </td>
                        <td>
                            <div class="form-floating">
                                <input type="text" name="customer_name" class="form-select"/>
                            <label for="floatingSelect">customer_name</label>
                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-floating">
                                <input type="text" name="customer_id" class="form-select"/>
                            <label for="floatingSelect">Customer ID</label>
                        </div>
                        </td>
                        <td>
                            <div class="form-floating">
                                <input type="text" name="customer_name" class="form-select"/>
                            <label for="floatingSelect">customer_name</label>
                        </div>
                        </td>
                    </tr>
                </table>
                <div class="submission">
                    <input class="btn btn-outline-primary" type="submit" value="Search">
                    <input class="btn btn-outline-warning" type="reset" value="Back">
                </div>
            </form>
        </div>
        </div>



        
        
        
        
        
    </body>
</html>
