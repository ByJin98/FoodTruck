package com.java.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBconnect {
	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";

	public DBconnect() {
		Connection con = null;
		String driver = "org.mariadb.jdbc.Driver";
		String url = "jdbc:mariadb://localhost:3306/Hungry";
		String uid = "Hungry";
		String pwd = "123456";
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, uid, pwd);

		} catch (ClassNotFoundException e1) {
			System.out.println("����̹� �ε� ����");
		} catch (SQLException e2) {
			System.out.println(e2);
		}
	}
	public static void main(String[] args) {
		Connection con = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, uid, pwd);

		} catch (ClassNotFoundException e1) {
			System.out.println("����̹� �ε� ����");
		} catch (SQLException e2) {
			System.out.println(e2);
		}
	}

	/*
	 * public void DBconnect() { try { Class.forName(driver); Connection con = null;
	 * con = DriverManager.getConnection(url, uid, pwd); System.out.println("����");
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } }
	 */
}

/*
 * String sql = "SELECT / FROM MEMBER"; // SQL��
 * 
 * stmt = con.createStatement(); SQL�� ����. SELECT���� ��� executeQuery() ȣ���ؼ�
 * ResultSet Ÿ���� ���̺� �������� ����� ������
 * 
 * stmt.executeQuery(sql); // executeUpdate = Insert, update, delete �� ����ҋ�(DB����
 * ���ڿ��� ��� ' ' ���) rs = stmt.executeQuery(sql); // executeQuery = select ����� ��
 * 
 * select�� ������ �� �����ִ� �� while(rs.next()){ System.out.print(rs.getInt(1));
 * System.out.print(rs.getStrung(2)); } con.close(); stmt.close(); rs.close();
 * 
 */
