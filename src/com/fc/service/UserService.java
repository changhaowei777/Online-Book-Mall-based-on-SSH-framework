package com.fc.service;

import org.springframework.transaction.annotation.Transactional;

import com.fc.dao.UserDao;
import com.fc.model.User;


@Transactional
public class UserService {


	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User checkUsername(String username) {
		return userDao.checkUsername(username);
	}

	public User checkPassword(String username,String password) {
		return userDao.checkPassword(username,password);
	}

	public void saveUser(User user) {
		userDao.saveUser(user);
		
	}

	public void updateInfo(User user) {
		userDao.updateInfo(user);
	}

	public void changePassword(Integer uid, String newPassword) {
		userDao.changePassword(uid, newPassword);
	}
	
	
}
