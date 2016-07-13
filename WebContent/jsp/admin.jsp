<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/Medicopedia/CSS/styles.css">
<title>Hello Admin</title>
</head>
<body>

<script>

function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}


window.onclick = function(e) {
  if (!e.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    for (var d = 0; d < dropdowns.length; d++) {
      var openDropdown = dropdowns[d];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>


<div class="top-bar" style="width: 100%;"><img src="/Medicopedia/images/top.png" width="100%" >
</div>
<ul>
  <li><a class="active" href="/Medicopedia/jsp/admin.jsp">Home</a></li>
 <li> <a href="/Medicopedia/jsp/deleteaccount.jsp">Delete Account</a></li>
  
<li> <a href="/Medicopedia/jsp/docstatus.jsp">Update Doctor's status </a></li>
<li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn" onclick="myFunction()">Manage Department</a>
    <div class="dropdown-content" id="myDropdown">
      <a href="/Medicopedia/jsp/dpartadd.jsp">Add Department</a>
      <a href="/Medicopedia/jsp/dpartdel.jsp">Delete Department</a>
    
    </div>
  </li>

<li><a href="/Medicopedia/Logoff">Log out</a></li>
</ul>




<div class="cbody" style="float: left;">


<% 
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userdetails");
if(uid==null||hs.isNew())
{
	response.sendRedirect("/Medicopedia/html/login.html");
}
else
{%>

<div class="main" style="width: 1000px; margin-left: 100px; padding: 50px;">


<h1 style="font-size: 50px;">hello <%=uid %>!</h1> 
<p style="font-size: 30px;">
Welcome
<br>
<br>

<br>
<br>
<br>
Hope you enjoy your time here.

 </p>





<%=new java.util.Date() %>
	

</div>

<%}
%>
</div>
<footer>
<p>Medicopedia &copy 2016
</footer>



</body>
</html>