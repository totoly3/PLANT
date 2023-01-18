package com.jy.member.model.service;



import com.jy.member.model.vo.Member;


public interface MemberService {
	//아래는 로그인
	Member loginMember(Member m);
	
	//아래는  회원가입
	int enrollmMember(Member m);
	
	//아래는 아이디 중복크체
	int IdCheck(String memberId);


	


}
