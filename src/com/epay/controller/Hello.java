package com.epay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epay.bean.Student;
import com.epay.service.IStudent;

@Controller
public class Hello {
	@Autowired
	private IStudent st;
	
	@RequestMapping("/hello")
	public String hello(Model model) {
		Student tt =  st.read();
				
		model.addAttribute("msg", tt.getName());
		return "hello";
	}
}
