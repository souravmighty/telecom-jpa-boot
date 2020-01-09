package com.deloitte.telecom.service;

import java.util.List;

import com.deloitte.telecom.entities.CustomerAccount;

public interface ICustomerAccountService {
	boolean credentialsCorrect(String mobileNo, String password);

    CustomerAccount save(CustomerAccount user);

	CustomerAccount findUserById(int id);
	
	CustomerAccount findByMobileNo(String mobileNo);

	List<CustomerAccount> fetchUsers(int blockSize);
	
	boolean rechargeAccount(CustomerAccount c, double amount);
}
