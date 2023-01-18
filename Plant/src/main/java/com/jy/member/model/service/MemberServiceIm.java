package com.jy.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.member.model.dao.MemberDao;
import com.jy.member.model.vo.Member;

@Service
public class MemberServiceIm implements MemberService{
	
	@Autowired
	private MemberDao MemberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	//아래는 로그인
	@Override
	public Member loginMember(Member m) {
		Member loginUser = MemberDao.loginMember(sqlSession,m);
		
		return loginUser;
	}
	
	//아래는 회원가입
	@Override
	public int enrollmMember(Member m) {
		System.out.println("서비스에서는?"+m);
		int result=MemberDao.enrollmMember(sqlSession,m);
		return result;
	}
	
	//아래는 아이디 중복체크 
	@Override
	public int IdCheck(String memberId) {
	
		return MemberDao.IdCheck(sqlSession,memberId);
		
	}

	

}
