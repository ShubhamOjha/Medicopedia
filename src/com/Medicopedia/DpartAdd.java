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
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class DpartAdd
 */
@WebServlet("/DpartAdd")
public class DpartAdd extends HttpServlet {
	private static ResultSet rs=null;
	private static Connection con=null;
	private static PreparedStatement ps,psu=null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DpartAdd() {
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

		HttpSession hs=request.getSession(false);
		String uid=(String)hs.getAttribute("userdetails");

		String dpart=request.getParameter("dpart");
		con=CrudeOperation.createConnection();
		String strins="insert into department(dpart_name) values(?)";
	
		try
		{
		
			

			
		
			
			ps=con.prepareStatement(strins);
            ps.setString(1, dpart);
         
            
      
            
            int rw=ps.executeUpdate();
		
		if(rw>0)
		{
			
		
			response.sendRedirect("/Medicopedia/jsp/dpartdel.jsp");
			
	
		}
		else
		{
			
		
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
