<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/Medicopedia/CSS/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Department</title>
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




<div class="cbody" >

<% 
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userdetails");
if(uid==null||hs.isNew())
{
	response.sendRedirect("/Medicopedia/html/login.html");
}
else
{%>

<div id="sc-edprofile" style="width: 1000px; margin-left: 150px;" >
  <h1>Add</h1>
  <div class="sc-container">




<form method="post" action="/Medicopedia/DpartAdd" padding-left="50px" margin-left="60px" align="left" padding-left="50px" >


<table style="margin-top:80px; margin-left:120px;">
<tr><td>Department Name</td><td><input type="text" name="dpart" id="dpart"
required="required" placeholder="enter department name" ></td></tr>



<tr><td colspan="2"><input type="submit" value="submit"></td></tr>
</table>

</form>


</div></div>


</div>
<div>
<footer>
<p>Medicopedia &copy 2016</p>
</footer>
</div>
</body>
</html>
<%}
%>





