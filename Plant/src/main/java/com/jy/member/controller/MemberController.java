package com.jy.member.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jy.member.model.service.MemberService;
import com.jy.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired(required=false)
	private MemberService MemberService;
	
	@Autowired(required=false)
	private BCryptPasswordEncoder bcryptpasswordEncoder;
	
	//아래는 로그인 
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m,HttpSession session,ModelAndView mv) {
		
		Member loginUser = MemberService.loginMember(m);

		if(loginUser != null ) {
			session.setAttribute("loginUser",loginUser);
			//setViewName : 요청 주소 
			mv.setViewName("redirect:/");//메인화면 재요청
		}else {//실패
			//addObject : setAttribute나 addAttribute와 같은 용도(requestScope에 등록)
			mv.addObject("errorMsg","로그인 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	//아래는 회원가입  폼으로 이동 
	@RequestMapping("insert.me")
	public String enrollForm() {
		System.out.println("회원가입폼 도착");
		return "member/memberEnrollForm";
	}
	
	//아래는 회원가입 등록하기
		@RequestMapping("enroll.me")
		public String enrollmMember(Member m,ModelAndView mv,HttpSession session) {
			int result=MemberService.enrollmMember(m);
			System.out.println("Member m:"+m);
			if(result>0) {
				//등록되었으면
				session.setAttribute("alertMsg", "회원가입이 완료되었습니다.");
				return "redirect:/";

			}else {
				return "common/errorPage";
			}
		
		}
	
		//아래는 아이디 중복확인 
		@ResponseBody
		@RequestMapping("IdCheck.me")
		public String IdCheck(String MemberId) {
		
			int count=MemberService.IdCheck(MemberId);
			//실제 3이 나오면   카운터가 0보다 크면 YYY
			//아래 결과가  0이면 0  , 1이면 1 (1이면 중복)
			return (count>0) ? "YYY" : "NNN";
	
			
		}
		
	
}
