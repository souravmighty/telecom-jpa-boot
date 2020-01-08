package com.deloitte.telecom.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "telecomservice")
public class CustomerAccount {
	
	
	//@Column(unique=true)
	private String mobileNo;
	
	public void setBalance(double balance) {
		this.balance = balance;
	}

	private String password;
	private String name;
	private String accountType;
	private double balance;
	
	public CustomerAccount() {
		
	}
	
	public CustomerAccount(String mobileNo, String password, String name, String accountType, double balance) {
		
		this.mobileNo = mobileNo;
		this.password = password;
		this.name = name;
		this.accountType = accountType;
		this.balance = balance;
	}
	
	@Id
	@GeneratedValue
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public double getBalance() {
		return balance;
	}
	public void addBalance(double balance) {
		this.balance += balance;
	}

	@Override
	public String toString() {
		return "Account Details [Mobile No=" + mobileNo + ", Name=" + name + ", Account Type=" + accountType + ", Balance="
				+ balance + "]";
	}

	@Override
	public int hashCode() {
		return id;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
		{
			return true;
		}	
		if (obj == null || !(obj instanceof CustomerAccount))
		{
			return false;
		}
		CustomerAccount c=(CustomerAccount)obj;
		return c.id==this.id;
		
	}
	
	

}
