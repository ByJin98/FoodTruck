package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.java.db.dto.MemberSignupDto;

public class MemberSignupDao {
	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";
	
	public MemberSignupDao() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void mInsert(MemberSignupDto insertDTO) {
		String id = insertDTO.getMemberID();
		String pw = insertDTO.getMemberPW();
		String name = insertDTO.getMemberName();
		String age = insertDTO.getAge();
		String Phone = insertDTO.getPhone();
		
		int num = 0;
		int mage = Integer.parseInt(age);
		
		String query = "insert into member_info values(?,?,?,?,?,?)";
	
		Connection con = null;
		PreparedStatement pstmt =null;
		try {
			con = DriverManager.getConnection(url,uid,pwd);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setInt(4, mage);
			pstmt.setString(5, Phone);
			pstmt.setInt(6, num);
			
			int resultQuery = pstmt.executeUpdate();
			if (1!=resultQuery)System.out.println("ȸ����Ͻ���");
			else System.out.println("ȸ����ϼ���!");
		}catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public int idCheck(String id) {
		String m_id = id;
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String query = "select * from member_info where member_id=?";
		try {
			con = DriverManager.getConnection(url,uid,pwd);
            pstmt = con.prepareStatement(query);
            
            pstmt.setString(1,m_id);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	
            	if(rs.getString("member_id").equals(m_id)) {
            			return 1;  //���̵� �ߺ�
            		}else{
            			return 2; //���̵� �ߺ� �ȵ�
            		}
            	}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 0;
	}
}
