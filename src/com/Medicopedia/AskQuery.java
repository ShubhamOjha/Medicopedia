package com.Medicopedia;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTML;

import com.dbutil.CrudeOperation;

/**
 * Servlet implementation class AskQuery
 */
@WebServlet("/AskQuery")
public class AskQuery extends HttpServlet {
	
	private static ResultSet rs=null;
	private static Connection con=null;
	private static PreparedStatement ps,psu=null;

	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskQuery() {
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
		String receiverid=request.getParameter("receiverid");
		String subject=request.getParameter("subject");
		String msg=request.getParameter("msg");
		String senderid=uid;
		String sstatus="false";
		String rcd="false";
		String snd="false";
		con=CrudeOperation.createConnection();
		String strins="insert into query(senderid,receiverid,problem,description,date,sstatus,rcd,snd) values(?,?,?,?,?,?,?,?)";
	
		try
		{
		
			
			java.util.Date d=new java.util.Date();
			java.sql.Date sd=new java.sql.Date(d.getTime());

			
		
			
			ps=con.prepareStatement(strins);
            ps.setString(1, senderid);
            ps.setString(2, receiverid);
            ps.setString(3, subject);
            ps.setString(4, msg);
            ps.setDate(5, sd);
            
            ps.setString(6, sstatus);
            ps.setString(7, rcd);
            ps.setString(8, snd);
       
            
      
            
            int rw=ps.executeUpdate();
		
		if(rw>0)
		{
			String message = "Message sent successfully";
			request.getSession().setAttribute("message", message);
		
			response.sendRedirect("/Medicopedia/jsp/askquery.jsp");
			
	
		}
		else
		{
			response.sendRedirect("/Medicopedia/jsp/patient.jsp");
			/*String message = "Message failed";
			request.getSession().setAttribute("message", message);*/
		
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
