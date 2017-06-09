package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	
	@RequestMapping("/AddStoreForm")
	public String addStoreForm() {
		return "addStoreForm";
	}//addStore
	
}
