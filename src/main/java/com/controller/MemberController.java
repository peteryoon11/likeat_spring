package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.MemberDTO;
import com.exception.LikeatException;
import com.service.MemeberService;

@Controller
@SessionAttributes("loginfo")
public class MemberController{

	@Autowired
	private MemeberService service;
	
    @ModelAttribute()
    public void beforeMemberController(HttpServletRequest req) {
        HttpSession sess = req.getSession();
        sess.setAttribute("loginfo", new MemberDTO());
    }
	
	
	@RequestMapping("JoinFormController")
	public String joinForm () {
		return "join";
	}

	
	@RequestMapping(value="/idDuplicationCheck/{userId}", produces="application/text; charset=utf8")
	public @ResponseBody String idDuplicationCheck(@PathVariable String userId) {
		System.out.println("idDuplicationCheck 실행");
		int exist = 1;
		String result = null;
		exist = service.useridCheck(userId);
		if(exist == 1) {
			result = "존재하는 아이디입니다";
		} else {
			result = "";
		}
		System.out.println("result ==> " + result);
		return result;
	}
	
	
	@RequestMapping("JoinController")
	public ModelAndView join (@ModelAttribute MemberDTO dto, RedirectAttributes reAttr) {
		ModelAndView mav = new ModelAndView();

		String target = "";
		
		try {
			service.join(dto);
			target = "redirect:LikeatMainController";
			reAttr.addFlashAttribute("SuccessAlert", "가입을 축하드립니다");
		} catch (LikeatException e) {
			e.printStackTrace();
			target = "error";
			mav.addObject("errorMsg", "가입 절차 중 문제가 발생했어요 :-( ");
			mav.addObject("linkMsg", "회원가입 재시도!");
			mav.addObject("link", "JoinFormController");
		}
		mav.setViewName(target);
		return mav;
	} // join()
	
	
	
	@RequestMapping("LoginFormController")
	public String loginForm (Model m) {
		return "login";
	}//loginForm
	

	
	@RequestMapping("LoginController")
	public String login (MemberDTO dto, Model m, RedirectAttributes reAttr) {
		String target = "";
		HashMap<String, String> loginfo = new HashMap<>();
		loginfo.put("userid", dto.getUserid());
		loginfo.put("userpw", dto.getUserpw());
		
		try {
			dto = service.login(loginfo);
			if(dto != null) {
				m.addAttribute("loginfo", dto);
				reAttr.addFlashAttribute("SuccessAlert", dto.getUsername() + "님 어서오세요");
				target = "redirect:LikeatMainController";
			} else {
				reAttr.addFlashAttribute("loginFail", "아이디나 비밀번호를 다시 확인해주세요");
				target = "redirect:LoginFormController";
			}
		} catch (LikeatException e) {
			e.printStackTrace();
			target = "error";
			reAttr.addFlashAttribute("errorMsg", "로그인 중 문제가 발생했어요 :-( ");
			reAttr.addFlashAttribute("linkMsg", "로그인 재시도!");
			reAttr.addFlashAttribute("link", "LoginFormController");
		}
		System.out.println("login() return 직전의 model ==> " + m);
		return target;
	} // login()
	
	
	
	
	@RequestMapping("LogoutController")
	public String logout(SessionStatus status, Model m, RedirectAttributes reAttr) {
		status.setComplete();
		reAttr.addFlashAttribute("SuccessAlert", "로그아웃 되었습니다");
		return "redirect:LikeatMainController";
	}//logout
	
	
	
	@RequestMapping("MemberInfoModifyController")
	public ModelAndView memberInfoModify (MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		String target = "";
		String str = "";
		try {
			service.modifyMember(dto);
			target = "redirect:MyPageController";
			/*request.setAttribute("SuccessAlert", "가입을 축하드립니다");*/
		} catch (LikeatException e) {
			e.printStackTrace();
			target = "error";
//			request.setAttribute("errorMsg", "회원정보 수정 중 문제가 발생했어요 :-( ");
//			request.setAttribute("linkMsg", "마이페이지로 이동!");
//			request.setAttribute("link", "MyPageController");
			mav.addObject("errorMsg", "회원정보 수정 중 문제가 발생했어요 :-( ");
			mav.addObject("linkMsg", "마이페이지로 이동!");
			mav.addObject("link", "MyPageController");
		}
		mav.setViewName(target);
		return mav;
	}// memberInfoModify()
	
	
	
	@RequestMapping("MyPageController")
	public String myPage (@ModelAttribute("loginfo") MemberDTO dto) {
		
		return "mypage";
	}// myPage()
	
	
}
