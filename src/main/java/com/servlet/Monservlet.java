package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.User;

/**
 * Servlet implementation class Monservlet
 */
@WebServlet(name="Registration",  urlPatterns= {"/inscription"})
public class Monservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Monservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp-file/inscrire.jsp").forward(request, response);
		// request.setAttribute("users", User.getAll());
		// this.getServletContext().getRequestDispatcher("/WEB-INF/jsp-file/accueil.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		List<User> list = (ArrayList<User>) session.getAttribute("list");			
		if(session.getAttribute("list") == null)
			list = new ArrayList<User> ();
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String pseudo = request.getParameter("pseudo");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User user = new User();
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setPseudo(pseudo);
		user.setEmail(email);
		user.setPwd(password);
		
		list.add(user);
		
		session.setAttribute("user", user);
		session.setAttribute("list", list);
		response.sendRedirect(request.getContextPath() + "/accueil");
	}
}