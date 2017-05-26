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
			dao.join(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new LikeatException("회원가입실패!!!!!!!!!!!!!");
		}	
	}//join
	
	public int useridCheck(String userid) {
		int result = 1;
		try{
			result = dao.useridCheck(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void modifyMember(MemberDTO dto) throws LikeatException {
		
		try{
			dao.modifyMember(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new LikeatException("회원정보수정실패!!!!!!!!!!!!!");
		}	
	}//modifyMember

	
	public MemberDTO login(HashMap<String, String> loginfo) throws LikeatException {
		
		MemberDTO dto = null;
		
		try {
			dto = dao.login(loginfo);	
		} catch (Exception e) {
			e.printStackTrace();
			throw new LikeatException("로그인실패!!!!!!!!!!!!!!!!");
		}
		return dto;
	}//login

}
