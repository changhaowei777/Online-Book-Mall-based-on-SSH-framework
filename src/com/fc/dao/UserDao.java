package com.fc.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.fc.model.User;

public class UserDao extends HibernateDaoSupport {

	public User checkUsername(String username) {
		List<User> list = (List<User>) this.getHibernateTemplate().find("from User where username=?",username);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public User checkPassword(String username,String password) {
		List<User> list = (List<User>) this.getHibernateTemplate().find("from User where username=? and password=?",username,password);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void saveUser(User user) {
		this.getHibernateTemplate().save(user);
	}

	public void updateInfo(User user) {
		this.getHibernateTemplate().update(user);
	}

	public void changePassword(Integer uid, String newPassword) {
		User user = this.getHibernateTemplate().get(User.class, uid);
		user.setPassword(newPassword);
		this.getHibernateTemplate().update(user);
	}

	
}
