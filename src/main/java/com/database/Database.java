package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Database {
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.exit(0);
		}
		Connection connection = null;
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tp_servlet", "moise", "moise");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public static PreparedStatement getStatement(String query) {
		//Statement statement = null;
		PreparedStatement statement = null;
		try {
			statement = getConnection().prepareStatement(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return statement;
	}
	
	public static ResultSet select(String query, String [] parameters) {
		ResultSet result = null;
		PreparedStatement statement = getStatement(query);
		try {
			int i = 1;
			for(String parameter : parameters) {
				statement.setString(i, parameter);
				i++;
			}
			result = statement.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public static void insert(String query, String [] parameters) {
		PreparedStatement statement = getStatement(query);
		try {
			int i = 1;
			for(String parameter : parameters) {
				statement.setString(i, parameter);
				i++;
			}
			statement.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close() {
		try {
			if(getConnection() != null)
				getConnection().close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
