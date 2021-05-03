package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java.db.dto.MemberSignupDto;

public class MemberSignupDao {
	private Connection con;

	public MemberSignupDao() {
		try {
			String driver = "org.mariadb.jdbc.Driver";
			String url = "jdbc:mariadb://localhost:3306/Hungry";
			String uid = "Hungry";
			String pwd = "123456";
			Class.forName(driver);
			con = DriverManager.getConnection(url,uid,pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int mInsert(String userID, String userPassword, String usernName, String userAge, String userPhone) {
		PreparedStatement pstmt = null;
		//ResultSet rs =null;
		
		String query = "insert into member_info values(?,?,?,?,?,?)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, usernName);
			pstmt.setInt(4, Integer.parseInt(userAge));
			pstmt.setString(5, userPhone);
			pstmt.setInt(6, 0);

			return pstmt.executeUpdate();
		} catch (Exception e) {
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
		return -1; //�����ͺ��̽� ����
	}

	public int idCheck(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from member_info where member_id = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next() || id.equals("")) {
				return 0; //�̹������ϴ� ȸ��
			}else {
				return 1; //���� ������ ȸ�� ���̵�
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //�����ͺ��̽� ����
	}
	
	public int phoneCheck(String phonenum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from member_info where member_phone = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, phonenum);
			rs = pstmt.executeQuery();
			if(rs.next() || phonenum.equals("")) {
				return 0; //�̹������ϴ� ȸ��
			}else {
				return 1; //���� ������ ȸ�� ���̵�
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //�����ͺ��̽� ����
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}