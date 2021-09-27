package com.java.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.db.dao.ShopLoginDao;


public class LoginShopCMD implements MainCommand {
	String id = null;
	String pw = null;

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		ShopLoginDao dao = new ShopLoginDao();
		
		id = request.getParameter("shop_id");
		pw = request.getParameter("shop_pw");


		int result = dao.login(id, pw);	
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
	
		try {
			if (result == 1) {
				session.setAttribute("shop_id",id);
				System.out.print("사업자 로그인 완료 / 아이디: " + id + " 비밀번호: " + pw );
				response.sendRedirect("main.do");

			} else if (result == -1) {
				System.out.print(id + " --- " + pw + " 로그인실패 ");
				   String msg = "로그인 실패.";
				   String str="";
				   str = "<script language='javascript'>";
				   str += "alert('"+ msg + "');";   //얼럿창 띄우기
				   str += "document.location.href='/FoodTruck/login_shop.jsp'";    //이전페이지로 가기
				   str += "</script>";
				   out.print(str);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
