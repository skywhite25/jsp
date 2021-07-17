package com.OOTD.timeline.service;

import com.OOTD.main.controller.Service;
import com.OOTD.timeline.dao.TimelineDAO;

public class TimelineDeleteService implements Service{

	//dao가 필요하다. 밖에서 생성한 후 넣어준다. - 1. 생성자. 2. setter()
	private TimelineDAO dao;
	
	// 기본 생성자 만들기 -> 확인 시 필요하다.
	public TimelineDeleteService() {
		// TODO Auto-generated constructor stub
		System.out.println("TimelineDeleteService.TimelineDeleteService() - 생성 완료");
	}
	
	@Override
	public void setDAO(Object dao) {
		System.out.println("TimelineDeleteService.setDAO().dao : " + dao);
		this.dao = (TimelineDAO) dao;
	}
	
	// url 요청에 따른 처리
	// 넘어오는 데이터가 no ==> obj
	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		// 넘어오는 데이터 확인
		System.out.println("TimelineDeleteService.obj : " + obj);
		return dao.delete((Long) obj);
	}

}
