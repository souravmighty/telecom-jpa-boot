package com.deloitte.telecom.service;

import com.deloitte.telecom.dao.ICustomerAccountDao;
import com.deloitte.telecom.entities.CustomerAccount;
import com.deloitte.telecom.exceptions.IncorrectMobileNoException;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class CustomerAccountServiceImpl implements ICustomerAccountService {

    private ICustomerAccountDao userDao;

    public ICustomerAccountDao getUserDao() {
        return userDao;
    }

    @Autowired
    public void setUserDao(ICustomerAccountDao dao) {
        this.userDao = dao;
    }

    @Override
    public boolean credentialsCorrect(String mobileNo, String password) {
        return userDao.credentialsCorrect(mobileNo, password);
    }

    @Override
    public CustomerAccount findUserById(int id) {
        return userDao.findUserById(id);
    }

    @Override
    public CustomerAccount save(CustomerAccount user) {
    	String phone=user.getMobileNo();
    	if(phone==null || phone.length()!=10) {
    		throw new IncorrectMobileNoException("Incorrect mobile number");
    	}
        return getUserDao().save(user);
    }

	@Override
	public CustomerAccount findByMobileNo(String mobileNo) {
		CustomerAccount user=userDao.findByMobileNo(mobileNo);
		return user;
	}

	@Override
	public List<CustomerAccount> fetchUsers(int blockSize) {
		List<CustomerAccount>users=userDao.fetchUsers(blockSize);
		return users;
	}
	
	@Override
	public boolean rechargeAccount(CustomerAccount c, double amount) {
		return userDao.rechargeAccount(c, amount);
	}

    /*
    @PostConstruct
    public void init(){
       CustomerAccount user1=new CustomerAccount("satya","satya");
       userDao.save(user1);
       CustomerAccount user2=new CustomerAccount("pranav","pranav");
       userDao.save(user2);
    }*/
}
