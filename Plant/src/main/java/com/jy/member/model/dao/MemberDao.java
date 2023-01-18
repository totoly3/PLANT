
package com.jy.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jy.member.model.vo.Member;
@Repository
public class MemberDao {
	
	//로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}
	//아래는 회원가입
	public int enrollmMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.enrollmMember",m);
	}
	
	//아래는 아이디 중복체크
	public int IdCheck(SqlSessionTemplate sqlSession, String memberId) {
		System.out.println("Dao에서 memberId"+memberId);
		int result=sqlSession.selectOne("memberMapper.IdCheck",memberId);
		System.out.println("Dao에서 result결과는?????"+result);
		return result;
	}
	
}
