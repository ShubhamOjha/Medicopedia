package com.Medicopedia;

import com.dbutil.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class Patreg
 */
@WebServlet("/Patreg")
public class Patreg extends HttpServlet {
	private static ResultSet rs=null;
	private static Connection con=null;
	private static PreparedStatement ps,psu=null;
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Patreg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		

		response.setContentType("text/html");

		String un=request.getParameter("txtnm");
		String upass=request.getParameter("pwd");
		String uid=request.getParameter("txtid");
		String em=request.getParameter("txtem");
		
		String rdg=request.getParameter("rgender");
		String add=request.getParameter("add");
		int age=Integer.parseInt(request.getParameter("age"));
	
		
		
            con=CrudeOperation.createConnection();
		String usertype="patient";
		String status="true";
		
		String strins="insert into login values(?,?,?,?)";
		String strinsert="insert into patient values(?,?,?,?,?,?,?,?)";//place holder
		try
		{
			long ph=Long.parseLong(request.getParameter("txtno"));
			psu=con.prepareStatement(strins);
			ps=con.prepareStatement(strinsert);
            ps.setString(1, uid);
            ps.setString(2, un);
            ps.setString(3, add);
            ps.setString(4, rdg);
            ps.setInt(5, age);
            ps.setLong(6, ph);
            ps.setString(7, upass);
            ps.setString(8, em);
           
            
            psu.setString(1, uid);
            psu.setString(2, upass);
            psu.setString(3, usertype);
            psu.setString(4, status);
		
		int rs=ps.executeUpdate();
		int rw=psu.executeUpdate();
		if(rs>0&&rw>0)
		{
			
			response.sendRedirect("/Medicopedia/html/login.html");
			
	
		}
		
		
		
		}
		
		catch(Exception se)
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

}
