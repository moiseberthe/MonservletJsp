package com.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.database.Database;

public class User {
	
	private String firstname;
	private String lastname;
	private String pseudo;
	private String email;
	private String pwd;
	
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	public String getPseudo() {
		return pseudo;
	}
	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public void create() throws SQLException {
		//String[] params = {this.getFirstname(), this.getLastname(), this.getPseudo(), this.getEmail(), this.getPwd()};
		String[] params = {};
		Database.insert("INSERT INTO user (firstname, lastname, pseudo, email, password) VALUES ('"+this.getFirstname()+"', '"+this.getLastname()+"', '"+this.getPseudo()+"', '"+this.getEmail()+"', '"+this.getPwd()+"');", params);
		
	}
	
	public static List<User> getAll() {
		List<User> users = new ArrayList<User>();
		String[] params = {"1"};
		try {
			ResultSet result = Database.select("SELECT * FROM user WHERE ? ", params);
			while(result.next()) {
				User user = new User();
				user.setFirstname(result.getString("firstname"));
				user.setLastname(result.getString("lastname"));
				user.setPseudo(result.getString("pseudo"));
				user.setEmail(result.getString("email"));
				
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return users;
	}
	
	public static User getConnection(String login, String pwd) {
		
		User user = new User();
		String[] params = {login, login, pwd};
		try {
			ResultSet result = Database.select("SELECT * FROM user WHERE (pseudo = ? OR email = ?) AND password = ? ", params);
			while(result.next()) {
				user.setFirstname(result.getString("firstname"));
				user.setLastname(result.getString("lastname"));
				user.setPseudo(result.getString("pseudo"));
				user.setEmail(result.getString("email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
}
