package com.jy.plant.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class Plant {
	private int plantNo; //		P_NO	NUMBER
	private int memberNo;			//		M_NO	NUMBER
	private String plantName;			//		P_NAME	VARCHAR2(300 BYTE)
	private String plantContent;			//		P_CONTENT	VARCHAR2(3000 BYTE)
	private int plantLike;			//		P_LIKE	NUMBER
	private String plantOriginName;			//		P_ORIGIN_NAME	VARCHAR2(300 BYTE)
	private String plantChangeName;			//		P_CHANGE_NAME	VARCHAR2(300 BYTE)
	private String plantStatus;			//		P_STATUS	VARCHAR2(30 BYTE)
}
