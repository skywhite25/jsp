package com.OOTD.member.service;

import com.OOTD.member.dao.MemberDAO;
import com.OOTD.member.vo.LoginVO;
import com.OOTD.main.controller.Service;

public class MemberLoginService implements Service{

	//dao가 필요하다. 밖에서 생성한 후 넣어준다. - 1. 생성자. 2. setter()
	private MemberDAO dao;
	
	@Override
	public void setDAO(Object dao) {
		this.dao = (MemberDAO) dao;
	}
	
	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return dao.login((LoginVO) obj);
	}

}
