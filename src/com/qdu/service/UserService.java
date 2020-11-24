package com.qdu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qdu.bean.Admin;
import com.qdu.bean.User;
import com.qdu.dao.UserMapper;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;

	public void userRegister(User user) {
		userMapper.userRegister(user);
	}

	public List<User> checkUserLogin(User user) {
		return userMapper.checkUserLogin(user);
	}

	public List<Admin> checkAdminLogin(Admin admin) {
		return userMapper.checkAdminLogin(admin);
	}

	public List<User> checkNameCommon(User user) {
		return userMapper.checkNameCommon(user);
	}

	public String getUserPassword(String username) {
		return userMapper.getUserPassword(username);
	}

	public void changePassword(String password, String username) {
		userMapper.changePassword(password, username);
	}

}
