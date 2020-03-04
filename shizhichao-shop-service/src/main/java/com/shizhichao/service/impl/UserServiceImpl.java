package com.shizhichao.service.impl;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.shizhichao.config.AdminUserProperties;
import com.shizhichao.service.UserService;
@Service(interfaceClass=UserService.class,version="1.0.0")
public class UserServiceImpl implements UserService {

	@Autowired
	private AdminUserProperties adminUserProperties;
	
	
	@Override
	public boolean login(String userName, String passWord) {
		// TODO Auto-generated method stub
		return adminUserProperties.getAdminName().equals(userName) && adminUserProperties.getAdminPwd().equals(passWord);
	}

}
