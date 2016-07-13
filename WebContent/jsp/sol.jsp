<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*,com.dbutil.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/Medicopedia/CSS/styles.css">
<title>Solution</title>
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





<% 
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userdetails");
if(uid==null||hs.isNew())
             
      {
                  response.sendRedirect("/Medicopedia/html/login.html?msg=unauthorizedUser");	
                  
}
else

{Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
con=CrudeOperation.createConnection();
String strsql="select * from query where sstatus=? and snd=? and senderid=?";

String sstatus="true";
String snd="false";

%> 
<form method="post" action="/Medicopedia/Sol">
<div id="sc-edprofile" style="padding: 5px; width: 800px; margin-left: 200px;">
<table style="width: 800px;">
<tr><th>Delete</th><th>DoctorId</th><th>Date</th><th>Problem</th></tr>
<% 
try
{
	ps=con.prepareStatement(strsql);
	ps.setString(1, sstatus);
	ps.setString(2, snd);
	ps.setString(3,uid);
	rs=ps.executeQuery();
	
	while(rs.next())
	{%>
<tr><td><input type="checkbox" name="chk" value="<%=rs.getString("qid") %>"></td>
<td ><%=rs.getString("receiverid")%></td>
<td ><%=rs.getDate("date")%></td>
<td ><a href="/Medicopedia/jsp/viewsol.jsp?msg=<%=rs.getInt("qid")%>"><%=rs.getString("problem") %></a></td>
</tr>
<%} %>

<tr><th colspan="4"> <input type="submit" value="Delete" ></th></tr>
</table>
</div>
<% }
	catch(SQLException se)
	
	{
		System.out.println(se);
	  
	}
	}%>

</form>	




</div>
<div >
<footer>
<p>Medicopedia &copy 2016</p>
</footer>
</div>


</body>
</html>