package com.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.PageDTO;
import com.entity.StoreDTO;
import com.exception.LikeatException;
import com.service.StoreService;

@Controller
public class MainController {
	
	@Autowired
	private StoreService service;

	
	@RequestMapping("LikeatMainController")
	public ModelAndView likeatMain (String curPage) {
		ModelAndView mav = new ModelAndView();
		
		if(curPage == null) {
			curPage = "1";
		}		
		
		HashMap<String, String> mapperParam = new HashMap<>();
		mapperParam.put("curPage", curPage);
		mapperParam.put("main", "main");
		
		String target = "";
		
		try {
			PageDTO pageDTO = service.selectPage(mapperParam);
			
			List<StoreDTO> topList = service.selectTop(mapperParam);
			List<StoreDTO> newList = service.selectNew(mapperParam);
			
//			request.setAttribute("pageDTO", pageDTO);
//			request.setAttribute("topList", topList);
//			request.setAttribute("newList", newList);
			
			mav.addObject("pageDTO", pageDTO);
			mav.addObject("topList", topList);
			mav.addObject("newList", newList);
			
			target = "main";
			
		} catch (LikeatException e) {
			e.printStackTrace();
			target = "error";
//			request.setAttribute("errorMsg", "목록 불러오기에 실패했어요 :-( ");
//			request.setAttribute("linkMsg", "메인 다시 둘러보기!");
//			request.setAttribute("link", "LikeatMainController");

			mav.addObject("errorMsg", "목록 불러오기에 실패했어요 :-( ");
			mav.addObject("linkMsg", "메인 다시 둘러보기!");
			mav.addObject("link", "LikeatMainController");
		}
		mav.setViewName(target);
		return mav;
	}//likeatMain()

	
	
	@RequestMapping("CategoryCController")
	public ModelAndView categoryC () {
		ModelAndView mav = new ModelAndView();
		
		String searchKeyword = "중식";
		
		String target = "";
		
		try {
//			List<StoreDTO> list = service.searchKeyword(searchKeyword);
			List<StoreDTO> list = service.searchCategory(searchKeyword);
			
			int resultCnt = service.searchCnt(searchKeyword);
			
			if(list == null) {
				System.out.println("검색결과 없음 =========> null");
			} else {
//				request.setAttribute("searchList", list);
//				request.setAttribute("resultCnt", resultCnt);
				mav.addObject("searchList", list);
				mav.addObject("resultCnt", resultCnt);
				System.out.println("검색결과 not null =========> " + list);
			}
			target = "china";
		} catch (LikeatException e) {
			e.printStackTrace();
			target = "error";
//			request.setAttribute("errorMsg", "중식 목록불러오기 실패했어요 :-( ");
//			request.setAttribute("linkMsg", "메인으로 돌아가기!");
//			request.setAttribute("link", "LikeatMainController");
			mav.addObject("errorMsg", "중식 목록불러오기 실패했어요 :-( ");
			mav.addObject("linkMsg", "메인으로 돌아가기!");
			mav.addObject("link", "LikeatMainController");
		}
		mav.setViewName(target);
		return mav;
	}//categoryC()
	
	
	
	@RequestMapping("CategoryFController")
	public ModelAndView categoryF () {
		
		ModelAndView mav = new ModelAndView();

		String searchKeyword = "양식";
		
		String target = "";
		
		try {
			List<StoreDTO> list = service.searchCategory(searchKeyword);
			
			int resultCnt = service.searchCnt(searchKeyword);
			
			if(list == null) {
				System.out.println("검색결과 없음 =========> null");
			} else {
				mav.addObject("searchList", list);
				mav.addObject("resultCnt", resultCnt);
				System.out.println("검색결과 not null =========> " + list);
			}
			target = "foreign";
		} catch (LikeatException e) {
			e.printStackTrace();
			target = "error";
			mav.addObject("errorMsg", "양식 목록불러오기 실패했어요 :-( ");
			mav.addObject("linkMsg", "메인으로 돌아가기!");
			mav.addObject("link", "LikeatMainController");
		}
		
		mav.setViewName(target);
		return mav;		
	}//categoryF
	
	
	
	@RequestMapping("CategoryKController")
	public ModelAndView categoryK () {
		
		ModelAndView mav = new ModelAndView();

		String searchKeyword = "한식";
		
		String target = "";
		
		try {
			List<StoreDTO> list = service.searchCategory(searchKeyword);
			
			int resultCnt = service.searchCnt(searchKeyword);
			
			if(list == null) {
				System.out.println("검색결과 없음 =========> null");
			} else {
				mav.addObject("searchList", list);
				mav.addObject("resultCnt", resultCnt);
				System.out.println("검색결과 not null =========> " + list);
			}
			target = "korea";
		} catch (LikeatException e) {
			e.printStackTrace();
			target = "error";
			mav.addObject("errorMsg", "한식 목록불러오기 실패했어요 :-( ");
			mav.addObject("linkMsg", "메인으로 돌아가기!");
			mav.addObject("link", "LikeatMainController");
		}
		mav.setViewName(target);
		return mav;	
	}//categoryK()
	
	
	
	@RequestMapping("RegionGangnamController")
	public ModelAndView regionGangnam (String curPage) {
		ModelAndView mav = new ModelAndView();
		
		if(curPage == null) {
			curPage = "1";
		}		
		
		HashMap<String, String> mapperParam = new HashMap<>();
		mapperParam.put("curPage", curPage);
		mapperParam.put("gangnam", "gangnam");
		
		String target = "";

		try {
			PageDTO pageDTO = service.selectPage(mapperParam);
			
			List<StoreDTO> topList = service.selectTop(mapperParam);
			List<StoreDTO> newList = service.selectNew(mapperParam);
			
//			request.setAttribute("pageDTO", pageDTO);
//			request.setAttribute("topList", topList);
//			request.setAttribute("newList", newList);
			
			mav.addObject("pageDTO", pageDTO);
			mav.addObject("topList", topList);
			mav.addObject("newList", newList);
			
			target = "gangnam";
		} catch (LikeatException e) {
			e.printStackTrace();
			target = "error";
//			request.setAttribute("errorMsg", "강남지역목록 불러오기에 실패했어요 :-( ");
//			request.setAttribute("linkMsg", "메인으로 돌아가기!");
//			request.setAttribute("link", "LikeatMainController");
			
			mav.addObject("errorMsg", "강남지역목록 불러오기에 실패했어요 :-( ");
			mav.addObject("linkMsg", "메인으로 돌아가기!");
			mav.addObject("link", "LikeatMainController");
		}
		
		mav.setViewName(target);
		return mav;	
	}// regionGangnam()
	
	
	@RequestMapping("RegionSongpaController")
	public ModelAndView regionSongpa (String curPage) {
		ModelAndView mav = new ModelAndView();
		
		if(curPage == null) {
			curPage = "1";
		}		
		
		HashMap<String, String> mapperParam = new HashMap<>();
		mapperParam.put("curPage", curPage);
		mapperParam.put("songpa", "songpa");
		
		String target = "";

		try {
			PageDTO pageDTO = service.selectPage(mapperParam);
			
			List<StoreDTO> topList = service.selectTop(mapperParam);
			List<StoreDTO> newList = service.selectNew(mapperParam);
			
			mav.addObject("pageDTO", pageDTO);
			mav.addObject("topList", topList);
			mav.addObject("newList", newList);

			target = "songpa";
		} catch (LikeatException e) {
			e.printStackTrace();
			target = "error";
			mav.addObject("errorMsg", "송파지역목록 불러오기에 실패했어요 :-( ");
			mav.addObject("linkMsg", "메인으로 돌아가기!");
			mav.addObject("link", "LikeatMainController");
		}
		mav.setViewName(target);
		return mav;	
	}// regionSongpa()

	
	@RequestMapping("RegionYongsanController")
	public ModelAndView regionYongsan (String curPage) {
		ModelAndView mav = new ModelAndView();
		
		if(curPage == null) {
			curPage = "1";
		}		
		
		HashMap<String, String> mapperParam = new HashMap<>();
		mapperParam.put("curPage", curPage);
		mapperParam.put("yongsan", "yongsan");
		
		String target = "";

		try {
			PageDTO pageDTO = service.selectPage(mapperParam);
			
			List<StoreDTO> topList = service.selectTop(mapperParam);
			List<StoreDTO> newList = service.selectNew(mapperParam);
			
			mav.addObject("pageDTO", pageDTO);
			mav.addObject("topList", topList);
			mav.addObject("newList", newList);
			
			target = "yongsan";
		} catch (LikeatException e) {
			e.printStackTrace();
			target = "error";

			mav.addObject("errorMsg", "용산지역목록 불러오기에 실패했어요 :-( ");
			mav.addObject("linkMsg", "메인으로 돌아가기!");
			mav.addObject("link", "LikeatMainController");
		}
		mav.setViewName(target);
		return mav;	
	}// regionYongsan()

}
