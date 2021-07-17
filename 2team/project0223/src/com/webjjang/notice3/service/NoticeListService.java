package com.webjjang.notice3.service;

import com.webjjang.main.controller.Service;
import com.webjjang.notice3.dao.NoticeDAO;

public class NoticeListService implements Service{

	// dao가 필요하다. 밖에서 생성한 후 넣어준다. - 1. 생성자. 2. setter()
	NoticeDAO dao;
	
	@Override
	public void setDAO(Object dao) {
		this.dao =(NoticeDAO) dao;
	}
	
	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

}
