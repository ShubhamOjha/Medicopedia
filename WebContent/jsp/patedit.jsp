<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>

<%@page import="java.util.Date,com.dbutil.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/Medicopedia/CSS/styles.css">
<title>Edit Profile</title>
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
<div class="cbody" style="margin-left: 400px;">
<div id="sc-edprofile" align="center" >
  <h1>Edit Profile Form</h1>
  <div class="sc-container">


<% 
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userdetails");
if(uid==null||hs.isNew())
             
      {
                  response.sendRedirect("/Medicopedia/html/login.html?msg=unauthorizedUser");	
                  
}
else
{
     String strsql="select * from patient where userid=?";
     ResultSet rs=CrudeOperation.getData(strsql,uid);
     try
     {
     rs.next();

%>
<form action="/Medicopedia/PatEdit" method="post">
<table>
<tr><td>Email id</td><td><input type="text" value="<%=rs.getString("email")%>" name="txtem" ></td>
<tr><td>Phone No.</td><td><input type="text" value="<%=rs.getLong("contact")%>" name="txtph" ></td>
<tr><td>Address</td><td><input type="text" value="<%=rs.getString("address")%>" name="add" ></td>
<tr><td>Age</td><td><input type="text" value="<%=rs.getString("age")%>" name="age" ></td>
<tr><td><input type="hidden" value"<%=uid%>"name="txtuid" ></td></tr>
<tr><td colspan="2" ><input type="submit" value="submit"></td></tr>
</table>
</form>
<%	}
 	catch(SQLException se)
 	{System.out.println(se);
 	}
 	finally{

 		try {
 				if(rs!=null)
 					{
 						rs.close();
 					}
 				
 				
 			}
 		
 		catch(SQLException se)
 		{ 
 			System.out.println(se);
 		}
 	}	
 }

%>


</div></div>

</div>
<div >
<footer>
<p>Medicopedia &copy 2016</p>
</footer>
</div>

</body>
</html>