package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.entity.MemberDTO;

public class MemberInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		System.out.println("## request ==>" + request);
//		System.out.println("## response ==>" + response);
//		System.out.println("## handler ==>" + handler); 
		
		HttpSession sess = request.getSession();
		MemberDTO dto = (MemberDTO)sess.getAttribute("loginfo");
		
		if(dto != null && dto.getUserid() != null) {
			return true;
		} else {
			response.sendRedirect("redirect:LoginFormController");
			return false;
		}
	}//preHandle()

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
//		System.out.println("## request ==>" + request);
//		System.out.println("## response ==>" + response);
//		System.out.println("## handler ==>" + handler);
//		System.out.println("## modelAndView ==>" + modelAndView);
	}//postHandle()
	
}
