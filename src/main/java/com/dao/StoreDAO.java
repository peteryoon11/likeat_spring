package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class StoreDAO {
	
	@Autowired
	private SqlSessionTemplate template;
}
