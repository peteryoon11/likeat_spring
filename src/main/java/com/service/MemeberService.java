package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.entity.MemberDTO;
import com.exception.LikeatException;

@Service
public class MemeberService {
	
	@Autowired
	private MemberDAO dao;
	
	public void join(MemberDTO dto) throws LikeatException {
		try{
//			session.insert(namespace + "join", dto);
			dao.join(dto);

//			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new LikeatException("회원가입실패!!!!!!!!!!!!!");
		} finally {
//			session.close();
		}		
	}//join
	
	public int useridCheck(String userid) {
		int result = 1;
		try{
			result = dao.useridCheck(userid);
		} catch (Exception e) {
			e.printStackTrace();
//			throw new LikeatException("회원가입실패!!!!!!!!!!!!!");
		}
		return result;
	}

	public void modifyMember(MemberDTO dto) throws LikeatException {
		
		try{
//			session.update(namespace + "modify", dto);
			dao.modifyMember(dto);
			
//			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new LikeatException("회원정보수정실패!!!!!!!!!!!!!");
		} finally {
//			session.close();
		}		
	}//modifyMember

	public MemberDTO login(HashMap<String, String> loginfo) throws LikeatException {
		
		MemberDTO dto = null;
		
		try {
//			dto = session.selectOne(namespace + "login", loginfo);
			dto = dao.login(loginfo);	
			
//			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new LikeatException("로그인실패!!!!!!!!!!!!!!!!");
		} finally {
//			session.close();
		}
		return dto;
	}//login

	
	// 로그아웃 시 해당 사용자 맞는지 체크
	public MemberDTO userCheck(String userid) {
		MemberDTO dto = null;
		
		try {
			dto = dao.userCheck(userid);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}//login
	
}
