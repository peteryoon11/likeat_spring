package com.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.entity.SreplyDTO;
import com.entity.StoreDTO;
import com.service.SreplyService;
import com.service.StoreService;

@Controller
public class DetailController {

	@Autowired
	private StoreService service;

	@Autowired
	private SreplyService rservice;
	
	@RequestMapping("/DetailPageController")
	public String detailPage(@RequestParam String sid, Model m) {
		
		StoreDTO sDTO = service.selectOne(sid);
		// List<StoreDTO> slist= service.selectAll();
		List<SreplyDTO> rList = rservice.selectSID(sid);
		// rList.remove(o)
		int recount = rservice.countReview(sid);
		int recountLow = 0;
		int recountMiddle = 0;
		int recountHigh = 0;

		// int relowcount=rservice.
		for (SreplyDTO sreplyDTO : rList) {
			if (sreplyDTO.getRappr().equals("1")) {
				recountLow++;
			} else if (sreplyDTO.getRappr().equals("3")) {
				recountMiddle++;
			} else if (sreplyDTO.getRappr().equals("5")) {
				recountHigh++;
			}

		}
		
		String searchadd = sDTO.getAddr2().substring(4, 7).trim();
		System.out.println(searchadd);
		System.out.println(searchadd.length());
		List<StoreDTO> sNealist = service.searchNeaSto(searchadd);
		// 주위 가게 정보
		// rservice
		System.out.println(sDTO.getSname() + " 현재 들어온 가게 정보 ");

		boolean tt = sNealist.remove(sDTO);

		System.out.println("본인 정보 지워짐? " + tt);

		// 본인 정보 지우기 위한 소스 index 로 이전 에 있던 부분을 지움

		int i = 0, temp = 0;

		for (StoreDTO storeDTO : sNealist) {
			System.out.println(storeDTO);
			if (storeDTO.getSid().equals(sDTO.getSid())) {
				temp = i;
			}
			System.out.println(i++);
		}
		sNealist.remove(temp);

		HashMap<String, Integer> countcarr = new HashMap<>();
		countcarr.put("recountLow", recountLow);
		countcarr.put("recountMiddle", recountMiddle);
		countcarr.put("recountHigh", recountHigh);

		m.addAttribute("storeOne", sDTO);
		m.addAttribute("sNealist", sNealist);
		m.addAttribute("sreplylist", rList);
		m.addAttribute("recount", recount);
		m.addAttribute("countcarr", countcarr);

		// 주변 맛집 검색하기 위해서 sid 로 불러온 객체의 addr2 의 앞 2개만 잘라서 wild card로 검색 후에
	
		return "detail";
	}//detailPage()
}
