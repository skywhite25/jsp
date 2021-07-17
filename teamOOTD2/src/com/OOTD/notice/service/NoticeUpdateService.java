package com.OOTD.notice.service;

import com.OOTD.main.controller.Service;
import com.OOTD.notice.dao.NoticeDAO;
import com.OOTD.notice.vo.NoticeVO;

public class NoticeUpdateService implements  Service{

	// dao가 필요하다. 밖에서 생성한 후  넣어준다. - 1.생성자, 2.setter()
	NoticeDAO dao = new NoticeDAO();
	
	@Override
	public void setDAO(Object dao) {
		System.out.println("NoticeUpdateService.obj: " + dao);
		this.dao = (NoticeDAO)dao;
	}
	
	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("NoticeUpdateService.obj: " + obj);
		return dao.update((NoticeVO) obj);
	}

}
