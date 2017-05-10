package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.dao.MemberDAO;
import com.dao.MySqlSessionFactory;
import com.entity.MemberDTO;
import com.exception.LikeatException;

public class MemeberService {
	
//	String namespace = "com.acorn.MemberMapper.";
	
	@Autowired
	private MemberDAO dao;
	
	public void join(MemberDTO dto) throws LikeatException {

		SqlSession session = MySqlSessionFactory.openMySession();

		try{
			session.insert(namespace + "join", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new LikeatException("회원가입실패!!!!!!!!!!!!!");
		} finally {
			session.close();
		}		
	}//join

	public void modifyMember(MemberDTO dto) throws LikeatException {
		
		SqlSession session = MySqlSessionFactory.openMySession();
		
		try{
			session.update(namespace + "modify", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new LikeatException("회원정보수정실패!!!!!!!!!!!!!");
		} finally {
			session.close();
		}		
	}//modifyMember

	public MemberDTO login(HashMap<String, String> loginfo) throws LikeatException {
		
		SqlSession session = MySqlSessionFactory.openMySession();
		
		MemberDTO dto = null;
		
		try {
			dto = session.selectOne(namespace + "login", loginfo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new LikeatException("로그인실패!!!!!!!!!!!!!!!!");
		} finally {
			session.close();
		}
		
		return dto;
		
	}//login
	
	
	

}
