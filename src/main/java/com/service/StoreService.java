package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.StoreDAO;
import com.entity.PageDTO;
import com.entity.StoreDTO;
import com.exception.LikeatException;

@Service
public class StoreService {
	
	@Autowired
	private StoreDAO dao;
	
	public PageDTO selectPage(HashMap<String, String> mapperParam) throws LikeatException {

		List<StoreDTO> list = null;
		
		PageDTO pageDTO = new PageDTO();
		
		int curPage = Integer.parseInt(mapperParam.get("curPage"));
		
		int skip = (curPage - 1) * pageDTO.getPerPage();
		
		try{
			
			list = dao.selectPage(mapperParam, skip, pageDTO.getPerPage());
			pageDTO.setList(list);
			pageDTO.setCurPage(curPage);
			pageDTO.setTotRecord(totRecord(mapperParam));
		} catch(Exception e) {	
			e.printStackTrace();
			throw new LikeatException("현재 페이지 목록 불러오기 실패!!!!!");
		}
		return pageDTO;
	}//selectAll
	
	
	public List<StoreDTO> selectTop(HashMap<String, String> mapperParam) throws LikeatException {

		List<StoreDTO> list = null;
		
		try{
			list = dao.selectTop(mapperParam);
		} catch(Exception e) {	
			e.printStackTrace();
			throw new LikeatException("TOP 목록 불러오기 실패!!!!!");
		}
		return list;
	}//selectTop

	public List<StoreDTO> selectNew(HashMap<String, String> mapperParam) throws LikeatException {
		
		List<StoreDTO> list = null;
		
		try{
			list = dao.selectNew(mapperParam);
		} catch(Exception e) {	
			e.printStackTrace();
			throw new LikeatException("NEW 목록 불러오기 실패!!!!!");
		}
		return list;
	}//selectTop


	public StoreDTO selectOne(String sid) {
		return dao.selectOne(sid);
	}// selectOne


	public List<StoreDTO> searchKeyword(String searchKeyword) throws LikeatException {
		
		List<StoreDTO> list = null;
		
		try{
			list = dao.searchKeyword(searchKeyword);
		} catch (Exception e) {
			e.printStackTrace();
			throw new LikeatException("찾기 목록 불러오기 실패!!!!!");
		}
		return list;
	}


	public List<StoreDTO> searchCategory(String searchKeyword) throws LikeatException {
		
		List<StoreDTO> list = null;
		
		try{
			list = dao.searchCategory(searchKeyword);
		} catch (Exception e) {
			e.printStackTrace();
			throw new LikeatException("찾기 목록 불러오기 실패!!!!!");
		}
		return list;
	}

	
	public int totRecord(HashMap<String, String> mapperParam) throws LikeatException {
		int cnt = 0;
		try{
			cnt = dao.totRecord(mapperParam);	
		} catch (Exception e) {
			e.printStackTrace();
			throw new LikeatException("식당 토탈 레코드 갯수 가져오기 실패!!!!!!!");
		}
		return cnt;
	}//totRecord


	public int searchCnt(String searchKeyword) throws LikeatException {
		int cnt = 0;
		try{
			cnt = dao.searchCnt(searchKeyword);
		} catch (Exception e) {
			e.printStackTrace();
			throw new LikeatException("찾기목록 토탈 레코드 가져오기 실패!!!!!!!");
		}
		return cnt;
	}
	
	
	public List<StoreDTO> searchNeaSto(String addr2) {

		List<StoreDTO> list = null;
		int rcount=0;
		try{
//			list = session.selectList(namespace + "searchNeaSto",addr2);
			list = dao.searchNeaSto(addr2);
		}finally{
//			session.close();
		}
		return list;
	}

}
