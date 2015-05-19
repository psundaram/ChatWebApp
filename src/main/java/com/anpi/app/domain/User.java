package com.anpi.app.domain;


public class User{

	private String username;
	private String name;
	private String email;
	private Property properties;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Property getProperties() {
		return properties;
	}

	public void setProperties(Property properties) {
		this.properties = properties;
	}

	@Override
	public String toString() {
		return "username=" + username + ", name=" + name + ", email=" + email + ", properties=" + properties + "";
	}
	
}
