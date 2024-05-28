package com.daea.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daea.daos.UserDao;
import com.daea.dtos.UserDto;

@WebServlet("*.user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		
		String command=requestURI.substring(contextPath.length());
		System.out.println("command값:"+command);
		
		HttpSession session = request.getSession();
		UserDao dao = UserDao.getUserDao();
		
		if(command.equals("/registForm.user")) {
			dispatch("user/registForm.jsp", request, response);
		} else if(command.equals("/idCheck.user")) {
			String id = request.getParameter("id");
			String resultID = dao.idCheck(id);
			
			response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(resultID == null ? "null" : resultID);
		} else if(command.equals("/insertUser.user")) {
			UserDto dto = new UserDto();
			dto.setId(request.getParameter("id"));
			dto.setName(request.getParameter("name"));
			dto.setPassword(request.getParameter("password"));
			
			boolean isS = dao.insertUser(dto);
			if(isS) {
				dispatch("index.jsp", request, response);
			} else {
				dispatch("user/registForm.jsp", request, response);
			}
		}
	
	
	
	}
	
	public void dispatch(String url, HttpServletRequest request, 
			 HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher(url).forward(request, response);
	}

}
