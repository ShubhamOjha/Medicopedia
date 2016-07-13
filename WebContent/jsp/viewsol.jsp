<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*,com.dbutil.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/Medicopedia/CSS/styles.css">
<title>View Solution</title>
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

<div class="cbody" style="float: left;">

<div id="sc-edprofile" style=" margin-left: 400px;" >
  <h1>View Solution</h1>
<centre>  <div class="sc-container" style="align: center; padding: 50px">
<%
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userdetails");
if(uid==null||hs.isNew())
             
      {
                  response.sendRedirect("/Medicopedia/html/login.html?msg=unauthorizedUser");	
                  
}
else

{
	int qid=Integer.parseInt(request.getParameter("msg"));
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
con=CrudeOperation.createConnection();
String strsql="select * from query where qid=? and sstatus=? and snd=?" ;
String snd="false";
String sstatus="true";

try{
	ps=con.prepareStatement(strsql);
	ps.setInt(1, qid);
	ps.setString(2, sstatus);
	ps.setString(3, snd);
	rs=ps.executeQuery();
rs.next();
%>
<table>
<tr><td>Receiver Id::</td><td><%=rs.getString("receiverid")%></td></tr>
<tr><td>Date::</td><td><%=rs.getDate("date") %></td></tr>
<tr><td>Problem ::</td><td><%=rs.getString("problem") %></td></tr>
<tr><td>Description::</td><td><%=rs.getString("description") %></td></tr>
<tr><td>Solution::</td><td><%=rs.getString("solution") %></td></tr>


</table>


<%
}
catch(SQLException se)
{
	System.out.println(se);
}
finally
{  try{
	if(ps!=null)
	
	{
		ps.close();
		
	}}
	catch(SQLException e)
	     {
		System.out.println(e);
	      }
		
	}
		
	}


%>


</div></centre></div>

</div>


<div >
<footer>
<p>Medicopedia &copy 2016</p>
</footer>
</div>
</body>
</html>