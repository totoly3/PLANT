package com.jy.plant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PlantController {
	@GetMapping("list.bo")
	public String enrollForm2() {
		System.out.println("여긴왔음!");
		return "member/memberEnrollForm";
	}
}
