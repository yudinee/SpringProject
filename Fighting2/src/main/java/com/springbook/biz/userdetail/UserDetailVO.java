package com.springbook.biz.userdetail;

public class UserDetailVO {
	
	String phoneNumber1;
	String phoneNumber2;
	String address;
	String email;
	String id;
	public String getPhoneNumber1() {
		return phoneNumber1;
	}
	public void setPhoneNumber1(String phoneNumber1) {
		this.phoneNumber1 = phoneNumber1;
	}
	public String getPhoneNumber2() {
		return phoneNumber2;
	}
	public void setPhoneNumber2(String phoneNumber2) {
		this.phoneNumber2 = phoneNumber2;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "UserDetailVO [phoneNumber1=" + phoneNumber1 + ", phoneNumber2=" + phoneNumber2 + ", address=" + address
				+ ", email=" + email + ", id=" + id + "]";
	}
	
	

}
