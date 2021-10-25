package com.java.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.ShopInfoDao;
import com.java.db.dto.ShopInfoDto;

public class UserPositionCheckCMD implements MainCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/x-json; charset=UTF-8");
		
		double userX = Double.parseDouble(request.getParameter("userX"));
		double userY = Double.parseDouble(request.getParameter("userY"));

		if (userX == 0.0 && userY == 0.0) {// 위치값 사용 못할때
			// 서울시청 중심값
			userX = 37.56674327625219;
			userY = 126.97957478404084;
		}

		ArrayList<ShopInfoDto> dtos1 = new ArrayList<ShopInfoDto>();
		ShopInfoDao dao = new ShopInfoDao();
		ShopInfoDto dto1 = new ShopInfoDto();
		dtos1 = dao.shopReviewSelect(userX, userY);

		PrintWriter out = response.getWriter();
		String str1 = ""; //Review
		String str2 = ""; //Scroe
		if (null != dtos1) {
			for (int i = 0; i < 3; i++) {
				dto1 = dtos1.get(i);
				str1 += "    <div class=\'col-lg-4 col-sm-6 portfolio-item\' id=\'item\'>"
						+ "      <div class=\'card h-100\'>"
						+ "      <a href=\'#\'>"
						+ "      <img class=\'card-img-top\'";
						        if(null==dto1.getShopimg()){
						        	str1 +=" src=\'http://placehold.it/400x200\'";
						        }
						        else { 
						        	str1 += " src=\'"+ dto1.getShopimg()+"' width=\'400px\' height=\'200px\'";
						        }
				        str1 += " alt=\'\'></a>"
						+ "<div class=\'card-body\'>"
						+ "<h4 class=\'card-title\'>"
						+ "<a href=\'shop_info.do?shop_num="+dto1.getShopNum()+"\'>"+dto1.getShopName()+"</a>"
						+ "</h4>"
						+ "<p class=\'card-text\'>"+dto1.getShopIntro()+"</p>"
						+ "</div>"
						+ "<div class=\'card-footer\' align = \'right\'>"
						+ "<a href=\'shop_info.do?shop_num="+dto1.getShopNum()+"\' class=\'btn btn-primary\'>가게정보</a>"
						+ "</div>"
						+ "</div>"
						+ "</div>";
				        
			}
		}

		dtos1 = dao.shopScoreSelect(userX, userY);
		if (null != dtos1) {
			for (int i = 0; i < 3; i++) {
				dto1 = dtos1.get(i);
				str2 += "<div class=\'col-lg-4 col-sm-6 portfolio-item\' id=\'item\'>"
						+ "<div class=\'card h-100\'>"
						+ "<a href=\'#\'>"
						+ "<img class=\'card-img-top\'";
						        if(null==dto1.getShopimg()){
						        	str2 +=" src=\'http://placehold.it/400x200\'";
						        }
						        else { 
						        	str2 += " src=\'"+ dto1.getShopimg()+"' width=\'400px\' height=\'200px\'";
						        }
				        str2 += " alt=\'\'></a>"
						+ "<div class=\'card-body\'>"
						+ "<h4 class=\'card-title\'>"
						+ "<a href=\'shop_info.do?shop_num="+dto1.getShopNum()+"\'>"+dto1.getShopName()+"</a>"
						+ "</h4>"
						+ "<p class=\'card-text\'>"+dto1.getShopIntro()+"</p>"
						+ "</div>"
						+ "<div class=\'card-footer\' align = \'right\'>"
						+ "<a href=\'shop_info.do?shop_num="+dto1.getShopNum()+"\' class=\'btn btn-primary\'>가게정보</a>"
						+ "</div>"
						+ "</div>"
						+ "</div>";
				        
			}
		}
		
		
		  System.out.println(userX+"__"+userY); 
		  System.out.println("str1: "+ str1);
		  System.out.println("str2: "+ str2);
		 
		String result = "{\"review\": \""+str1.toString()+"\", \"score\": \""+str2.toString()+"\"}";

		out.println(result);
		
	}
}
