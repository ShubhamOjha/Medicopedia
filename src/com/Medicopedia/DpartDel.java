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
 * Servlet implementation class DpartDel
 */
@WebServlet("/DpartDel")
public class DpartDel extends HttpServlet {
	Connection con=null;
	PreparedStatement ps=null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DpartDel() {
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
		String[] accarr=request.getParameterValues("chk");
		
		String strdelete="delete from department where dpart_id=?";
		con=CrudeOperation.createConnection();
		
		try
		{ con.setAutoCommit(false);
			ps=con.prepareStatement(strdelete);
			for(int i=0;i<accarr.length;i++)
			{
				ps.setString(1,accarr[i]);
				ps.addBatch();
			}
			System.out.println(ps);
		int []rw =ps.executeBatch();
		
		int flag=0;
		for(int j=0;j<rw.length;j++)
		{
			if(rw[j]<0)
				{
					flag=1;
					break;
				}
		}
			if(flag==0)
			{
				con.commit();
				response.sendRedirect("/Medicopedia/jsp/dpartdel.jsp");
				
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
