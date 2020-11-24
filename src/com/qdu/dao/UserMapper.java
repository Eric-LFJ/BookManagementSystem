package com.qdu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qdu.bean.Admin;
import com.qdu.bean.User;

public interface UserMapper {

	void userRegister(User user);

	List<User> checkUserLogin(User user);

	List<Admin> checkAdminLogin(Admin admin);

	List<User> checkNameCommon(User user);

	String getUserPassword(String username);

	void changePassword(@Param("password")String password, @Param("username")String username);
	
}
