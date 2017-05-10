package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate template;

}
