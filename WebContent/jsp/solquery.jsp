<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*,com.dbutil.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/Medicopedia/CSS/styles.css">
<title>Provide Solution</title>
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
  <li><a class="active" href="/Medicopedia/jsp/doctor.jsp">Home</a></li>
 <li> <a href="/Medicopedia/jsp/docview.jsp">View Profile</a></li>
  
<li> <a href="/Medicopedia/jsp/docedit.jsp">Edit Profile</a></li>
<li><a href="/Medicopedia/jsp/solquery.jsp">Give Solutions</a></li>
<li><a href="/Medicopedia/jsp/docallqueries.jsp">All Queries</a></li>
<li><a href="/Medicopedia/Logoff">Log out</a></li>
</ul>


<div class="cbody" style="float: left;">









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
String strsql="select * from query where sstatus=? and rcd=? and receiverid=?";

String sstatus="false";
String rcd="false";

%> 

<table id="sc-edprofile" style="padding: 5px; width: 800px; margin-left:  200px;">
<tr><th>Query ID</th><th>Patient Id</th><th>Date</th><th>Problem</th></tr>
<% 
try
{
	ps=con.prepareStatement(strsql);
	ps.setString(1, sstatus);
	ps.setString(2, rcd);
	ps.setString(3,uid);
	rs=ps.executeQuery();
	
	while(rs.next())
	{%>
<tr>
<td style="font-family:Adobe Caslon Pro; font-size:25px; color:#004700 "><%=rs.getString("qid")%></td>
<td style="font-family:Adobe Caslon Pro; font-size:25px; color:#004700 "><%=rs.getString("senderid")%></td>
<td style="font-family:Adobe Caslon Pro; font-size:25px; color:#004700"><%=rs.getDate("date")%></td>
<td style="font-family:Adobe Caslon Pro; font-size:25px; color:#004700"><a href="/Medicopedia/jsp/givesol.jsp?msg=<%=rs.getInt("qid")%>"><%=rs.getString("problem") %></a></td>
</tr>
<%} %>
</table>
<% }
	catch(SQLException se)
	
	{
		System.out.println(se);
	  
	}
	}%>








</div>


<div >
<footer>
<p>Medicopedia &copy 2016</p>
</footer>
</div>

</body>
</html>