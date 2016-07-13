<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*,com.dbutil.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/Medicopedia/CSS/styles.css">
<title>Delete Department</title>
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
<% 
Connection con=null;
con=CrudeOperation.createConnection();
String strsql="select * from  department";

ResultSet rs=CrudeOperation.getData1(strsql);

%> 
<form method="post" action="/Medicopedia/DpartDel">
<div id="sc-edprofile" style="padding: 5px; width: 800px; margin-left: 200px;">
<table style="width: 800px;">
<tr><th>Select</th><th>Department Id</th><th>Department Name</th></tr>
<% 
try
{
	while(rs.next())
	{%>
<tr><th><input type="checkbox" name="chk" value="<%=rs.getString("dpart_id") %>"></th>
<td ><%=rs.getString("dpart_id")%></td>
<td ><%=rs.getString("dpart_name")%></td>
</tr>
<%} %>
	
<tr><td colspan="3"> <input type="submit" value="Delete" ></td></tr>
</table>
</div>
<% }
	catch(SQLException se)
	
	{
		System.out.println(se);
	  
	}%>

</form>	
</div>
<footer>
<p>Medicopedia &copy 2016
</footer>

</body>
<%} %>
</html>