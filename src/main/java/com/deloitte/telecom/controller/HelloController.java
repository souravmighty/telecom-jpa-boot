package com.deloitte.telecom.controller;

import com.deloitte.telecom.dto.SessionData;
import com.deloitte.telecom.entities.CustomerAccount;
import com.deloitte.telecom.exceptions.IncorrectMobileNoException;
import com.deloitte.telecom.exceptions.MobileNoAlreadyExistsException;
import com.deloitte.telecom.service.ICustomerAccountService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class HelloController {
	private static Logger Log= LoggerFactory.getLogger(HelloController.class);

    private ICustomerAccountService service;

    public ICustomerAccountService getService() {
        return service;
    }

    @Autowired
    public void setService(ICustomerAccountService service) {
        this.service = service;
    }

    private SessionData sessionData;

    @Autowired
    public void setSessionData(SessionData data) {
        this.sessionData = data;

    }

    public SessionData getSessionData() {
        return sessionData;
    }


    @GetMapping("/userinput")
    public ModelAndView userInput() {
        System.out.println("inside userinput");
        return new ModelAndView("userinput");
    }

    @GetMapping("/logincheck")
    public Object loginCheck(@RequestParam("mobileno") String mobileNo,
                                   @RequestParam("password") String password) {

        boolean correct = service.credentialsCorrect(mobileNo, password);
        System.out.println("Value" +correct);
        if (!correct) {
            return new ModelAndView("userinput","message","Incorrect mobile number or password.");
        }
        CustomerAccount user = service.findByMobileNo(mobileNo);
        sessionData.setUser(user);
        return new RedirectView("/home");
    }


    @GetMapping("/home")
    public Object home() {
        if (sessionData.getUser() == null) {
            return new RedirectView("/userinput");
        }
        CustomerAccount appUser = sessionData.getUser();
        ModelAndView mv = new ModelAndView("home", "user", sessionData);
        return mv;
    }


    @GetMapping("/processregister")
    public RedirectView processRegister(@RequestParam("name") String name,
    		@RequestParam("mobileno") String mobileNo, @RequestParam("accounttype") String accountType,
    		@RequestParam("password") String password, @RequestParam("balance") double balance){
    	CustomerAccount user = new CustomerAccount(mobileNo, password, name, accountType, balance);
    	System.out.println("inside processregister");
        user=service.save(user);
        sessionData.setUser(user);
        return new RedirectView("/userinput");
    }

    @GetMapping("/register")
    public ModelAndView register(){
        return new ModelAndView("/register");
    }

    @GetMapping("/signout")
    public RedirectView signout(){
        sessionData.setUser(null);
        return new RedirectView("/userinput");
    }
    
    @GetMapping("/recharge")
    public ModelAndView recharge(@RequestParam("amount") double amount) {
    	CustomerAccount appUser = sessionData.getUser();
    	boolean rechargeDone=service.rechargeAccount(appUser, amount);
    	sessionData.setRechargeDone(rechargeDone);
    	return new ModelAndView("home","user",sessionData);
    }
    
    @GetMapping("/error")
    public ModelAndView error(){
        return new ModelAndView("error","message","something went wrong");
    }

    @ExceptionHandler(MobileNoAlreadyExistsException.class)
    public ModelAndView handleIfMobileNumberAlreadyExists(MobileNoAlreadyExistsException e){
      return new ModelAndView("register","message","Mobile number already exists.");
    }
    
    @ExceptionHandler(IncorrectMobileNoException.class)
    public ModelAndView handleIfIncorrectMobileNo(IncorrectMobileNoException e){
      return new ModelAndView("register","message","Please enter valid mobile number.");
    }

    @ExceptionHandler(value = Throwable.class)
    public ModelAndView catchAll(Throwable e){
        e.printStackTrace();
      return new ModelAndView("error","message","Something went wrong");
    }


}
