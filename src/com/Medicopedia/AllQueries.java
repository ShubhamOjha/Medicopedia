package com.Medicopedia;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbutil.*;

/**
 * Servlet implementation class AllQueries
 */
@WebServlet("/AllQueries")
public class AllQueries extends HttpServlet {
	Connection con=null;
	PreparedStatement ps=null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllQueries() {
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
		String[] smsgarr=request.getParameterValues("chk");
		int[] msgarr=new int[smsgarr.length];
		for(int i=0;i<smsgarr.length;i++)
		{
			msgarr[i]=Integer.parseInt(smsgarr[i]);
		}
		String strupdate="update query set snd=? where qid=?";
		con=CrudeOperation.createConnection();
		String snd="true";
		int rw=-1;
		try
		{ 
			ps=con.prepareStatement(strupdate);
			for(int i=0;i<msgarr.length;i++)
			{
				ps.setString(1,snd);
				ps.setInt(2, msgarr[i]);
				System.out.println("test"); 
				
			}
			rw=ps.executeUpdate();
			if(rw>0)
			{
				response.sendRedirect("/Medicopedia/jsp/allqueries.jsp");
			}
			
		
		
		
			
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		
		finally
		{
			try{
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

}
