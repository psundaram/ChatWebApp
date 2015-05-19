package com.anpi.app.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jivesoftware.smack.AccountManager;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.XMPPConnection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Register {

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {
		System.out.println("Register");
		return new ModelAndView("register");
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signUp(HttpServletRequest request) {
		System.out.println("Register" + request.getParameter("name"));
		try {
			ConnectionConfiguration connConfig = new ConnectionConfiguration("10.5.3.217");
			XMPPConnection connection = new XMPPConnection(connConfig);
			Map<String, String> attributes = new HashMap<String, String>();
			attributes.put("email", request.getParameter("emailAddress"));
			attributes.put("name", request.getParameter("name"));
			connection.connect();
			AccountManager accountManager = connection.getAccountManager();
			accountManager.createAccount(request.getParameter("userName"), request.getParameter("password"), attributes);
			connection.disconnect();
			return new ModelAndView("login");
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("register");
		}

	}
	


}
