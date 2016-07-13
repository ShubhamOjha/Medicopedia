<%@ page import="java.sql.*,javax.servlet.*,com.dbutil.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/Medicopedia/CSS/styles.css">
<title>Doctor Details</title>
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

<div id="sc-edprofile" style=" margin-left: 400px;" >
  <h1>Doctor Profile</h1>
<centre>  <div class="sc-container" style="align: center; padding: 50px">



<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userdetails");
if(uid==null||hs.isNew())
{
	response.sendRedirect("/Medicopedia/html/login.html");
}
else
{
	String strsql="select * from doctor where userid=?";
	con=CrudeOperation.createConnection();
	try
	{
		ps=con.prepareStatement(strsql);
		ps.setString(1,uid);
		rs=ps.executeQuery();
		rs.next();%>
		<table>
		<tr><td>Name</td><td><%=rs.getString("name") %></td></tr>
		<tr><td>User id</td><td><%=rs.getString("userid") %></td></tr>
		<tr><td>Email</td><td><%=rs.getString("email") %></td></tr>
		<tr><td>Phone No.</td><td><%=rs.getLong("contact") %></td></tr>
		<tr><td>Address</td><td><%=rs.getString("Address") %></td></tr>
		<tr><td>Sex</td><td><%=rs.getString("sex") %></td></tr>
		<tr><td>Experience</td><td><%=rs.getString("experience") %></td></tr>
		<tr><td>Qualifications</td><td><%=rs.getString("qualification") %></td></tr>
		</table>
		<%
		}
	catch(SQLException se)
	{System.out.println(se);
	}
	finally{

		try {
				if(rs!=null)
					{
						rs.close();
					}
				
				if(ps!=null)
					{
						ps.close();
				
					}
			}
		
		catch(SQLException se)
		{ 
			System.out.println(se);
		}
	}	
}
	%>



</div></centre></div>

</div>

<footer>
<p>Medicopedia &copy 2016</p>
</footer>

</body>
</html>