package com.jy.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
	private int MemberNo;//	M_NO	NUMBER
	private int MemberGradeNo;			//	MG_NO	NUMBER
	private String MemberId;			//	M_ID	VARCHAR2(50 BYTE)
	private String MemberPwd;				//	M_PWD	VARCHAR2(150 BYTE)
	private String MemberName;			//	M_NAME	VARCHAR2(50 BYTE)
	private String MemberEmail;			//	M_EMAIL	VARCHAR2(150 BYTE)
	private String MemberPhone;			//	M_PHONE	VARCHAR2(50 BYTE)
	private String MemberAddress;			//	M_ADDRESS	VARCHAR2(250 BYTE)
	private String MemberGender;			//	M_GENDER	VARCHAR2(50 BYTE)
	private int MemberAge;			//	M_AGE	NUMBER
	private Date MemberCreateDate;			//	M_CREATE_DATE	DATE
	private Date MemberUpdateDate;			//	M_UPDATE_DATE	DATE
	private String MemberStatus;			//	M_STATUS	VARCHAR2(50 BYTE)
}
