package com.daea.dtos;

import java.sql.Date;

public class UserDto {

	
	private static final long serialVersionUID = 1L;

    private int seq;
    private String id;
    private String name;
    private String password;
    private String role;
    private Date regDate;
    
    
    
	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}



	public UserDto(int seq, String id, String name, String password, String role, Date regDate) {
		super();
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.password = password;
		this.role = role;
		this.regDate = regDate;
	}



	@Override
	public String toString() {
		return "UserDto [seq=" + seq + ", id=" + id + ", name=" + name + ", password=" + password + ", role=" + role
				+ ", regDate=" + regDate + "]";
	}



	public int getSeq() {
		return seq;
	}



	public void setSeq(int seq) {
		this.seq = seq;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getRole() {
		return role;
	}



	public void setRole(String role) {
		this.role = role;
	}



	public Date getRegDate() {
		return regDate;
	}



	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    
	
	
    
}
