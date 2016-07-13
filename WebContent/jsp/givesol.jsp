<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>

<%@page import="java.util.Date,com.dbutil.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/Medicopedia/CSS/styles.css">
<title>Give Solution</title>
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
<div class="cbody" >
<div id="sc-edprofile" style="width: 1000px; margin-left: 150px;" >
  <h1>Give Solution</h1>
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

	int qid=Integer.parseInt(request.getParameter("msg"));
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
con=CrudeOperation.createConnection();
     String strsql="select * from query where qid=? and rcd=? and sstatus=?";
     String rcd="false";
     String sstatus="false";
     ps=con.prepareStatement(strsql);
 	ps.setInt(1, qid);
 	ps.setString(2, rcd);
 	ps.setString(3, sstatus);
 	rs=ps.executeQuery();
     
     try
     {
     rs.next();

%>
<form action="/Medicopedia/GiveSol" method="post">
<table>
<tr><td>Query ID</td><td><%=rs.getInt("qid")%></td></tr>
<tr><td>Sender ID</td><td><%=rs.getString("senderid")%></td></tr>
<tr><td>Problem</td><td><%=rs.getString("problem")%></td></tr>
<tr><td>Description</td><td><%=rs.getString("description")%></td></tr>
<tr><td>Date</td><td><%=rs.getDate("date")%></td></tr>
<tr><td>Solution</td><td><textarea type="text" name="txtsol" id="txtsol" rows="8" cols="50"></textarea></td></tr>
<tr><td><input type="hidden" value="<%=qid %>" name="qid" id="qid"></td></tr>
<tr><td colspan="2" ><input align="center" type="submit" value="submit"></td></tr>
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



</div>
</div></div>

<div >
<footer>
<p>Medicopedia &copy 2016</p>
</footer>
</div>

</body>
</html>