package servlet.qiantai;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Validate;
import bean.SelectBean;

public class SearchServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SearchServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Validate vd = new Validate();
		String name = vd.getUnicode(request.getParameter("name"));
		String cuban = vd.getUnicode(request.getParameter("cuban"));
		String types = vd.getUnicode(request.getParameter("types"));
		String sql = "select * from dog ";
		String[] args = {"id","name","author","publishing","number","price","storage","brief","type","tate","sums","imgpath"};
		if(name != null && !name.equals("")){
			sql += "where name like '%"+name+"%'";
		}
		if(cuban != null && !cuban.equals("")){
			sql += "where publishing like '%"+cuban+"%'";
		}
		if(types != null && !types.equals("")){
			sql += "where type='"+types+"'";
		}
		SelectBean sb = new SelectBean();
		ArrayList al = sb.select(sql, args);
		request.setAttribute("search", al);
		RequestDispatcher rd=request.getRequestDispatcher("/qiantai/search.jsp");
        rd.forward(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
