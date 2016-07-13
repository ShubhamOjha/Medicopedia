<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*,com.dbutil.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/Medicopedia/CSS/styles.css">
<title>Ask Query</title>
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
   <li><a class="active" href="/Medicopedia/jsp/patient.jsp">Home</a></li>
 <li> <a href="/Medicopedia/jsp/patview.jsp">View Profile</a></li>
  
<li> <a href="/Medicopedia/jsp/patedit.jsp">Edit Profile</a></li>
<li><a href="/Medicopedia/jsp/askquery.jsp">Ask Query</a></li>
<li><a href="/Medicopedia/jsp/sol.jsp">Solutions</a></li>
<li><a href="/Medicopedia/Logoff">Log out</a></li>
</ul>
<div class="cbody" >
<div id="sc-edprofile" style="width: 1000px; margin-left: 150px;" >
  <h1>Ask Query</h1>
  <div class="sc-container">
<% 
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userdetails");
if(uid==null||hs.isNew())
{
	response.sendRedirect("/Medicopedia/html/login.html");
}
else
{Connection con=null;
con=CrudeOperation.createConnection();
String strsql="select * from login where usertype='doctor'";

ResultSet rs=CrudeOperation.getData1(strsql);
		%>


<form action="/Medicopedia/AskQuery" method="post">


<table>
<tr><td>Select the Doctor's ID</td><td>

<select id="receiverid" name="receiverid" >
<% 
try
{
	while(rs.next())
	{%>

  <option value="<%=rs.getString("userid")%>"><%=rs.getString("userid")%></option>
<%} %>
</select>


</td></tr>
<tr><td>Problem</td><td><input type="text" name="subject" id="subject"></td></tr>
<tr><td>Description</td><td><textarea rows="20" cols="100" name="msg" id="msg"></textarea></td></tr>
<tr><td><input type="hidden" value="<%=uid%>"name="txtuid" ></td></tr>
<tr><td><input type="submit" value="submit"></td><td><input type="reset" value="reset"></td></tr>

<% }
	catch(SQLException se)
	
	{
		System.out.println(se);
	  
	}}%>



</table>






</form>


</div>
</div>

<p>${message}</p>
<c:remove var="message" scope="session" /> 



</div>
<div >
<footer>
<p>Medicopedia &copy 2016</p>
</footer>
</div>

</body>
</html>