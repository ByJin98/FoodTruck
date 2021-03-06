package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ShopGeolocationDao {
	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";
	
	Connection con = null;
	PreparedStatement pstmt = null;

	
	public ShopGeolocationDao() {
		try {
			Class.forName(driver);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateDao(Double posx,Double posy,String shop_num ,  int shop_stat) {
		String query = "update shop_info set shop_areax = ? , shop_areay = ?,shop_stat = ? where shop_num = ? ";
		
		try {
        	con = DriverManager.getConnection(url,uid,pwd);
            pstmt = con.prepareStatement(query);
            
            pstmt.setDouble(1,posx);
            pstmt.setDouble(2,posy);
            pstmt.setInt(3, shop_stat);
            pstmt.setString(4,shop_num);
            
            pstmt.executeUpdate();
            System.out.println("/x/"+posx+"/y/"+posy+"/가게번호/"+shop_num);
            
        }catch(Exception e) {

            e.printStackTrace();   

        }finally {
        	try {

				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
        	}catch(Exception e2){
        		e2.printStackTrace();
        	}
	}
	
	}
}
