package com.daea.daos;

import org.apache.ibatis.session.SqlSession;

import com.config.SqlMapConfig;
import com.daea.dtos.UserDto;

public class UserDao extends SqlMapConfig{

	private String namespace = "com.daea.user.";
	
	private static UserDao userDao;
	private UserDao() {}
	public static UserDao getUserDao() {
		if(userDao == null) {
			userDao = new UserDao();
		}
		return userDao;
	}
	
	// 회원가입
	public boolean insertUser(UserDto dto) {
		int count = 0;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSessionFactory().openSession(true);
			count = sqlSession.insert(namespace + "insertUser", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return count>0?true:false;
	}
	
	// 아이디 중복 확인
	public String idCheck(String id) {
		String resultID = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSessionFactory().openSession(true);
			resultID = sqlSession.selectOne(namespace + "idCheck", id); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
		
		
		return resultID;
	}
	
	
}
























