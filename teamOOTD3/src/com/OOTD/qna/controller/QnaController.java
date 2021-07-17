package com.OOTD.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import com.OOTD.qna.vo.QnaVO;
import com.OOTD.main.controller.Beans;
import com.OOTD.main.controller.Controller;
import com.OOTD.main.controller.ExeService;
import com.OOTD.member.vo.LoginVO;
import com.OOTD.util.PageObject;
import com.OOTD.util.filter.AuthorityFilter;
 


public class QnaController implements Controller {

	private final String MODULE = "qna";
	private String jspInfo = null;
	
	private HttpSession session = null;
	private LoginVO loginVO = null;
	private String id = null;
	@Override
	
	public String execute(HttpServletRequest request) throws Exception{
		System.out.println("QnaController.execute()");
		
		//세션저장
		session = request.getSession();
		loginVO = (LoginVO) session.getAttribute("login");
		if(loginVO != null) id = loginVO.getId();
		
		PageObject pageObject = PageObject.getInstance(request);
		request.setAttribute("pageObject", pageObject); // 페이지를 보여주기 위해 서버객체에 담는다.
	

		switch (AuthorityFilter.url) {
		//리스트
		
		case "/" + MODULE +"/list.do":
			list(request, pageObject);
		
			jspInfo = MODULE + "/list";
			break;
		
		//view
			case "/" + MODULE +"/view.do":
				view(request);
				jspInfo = MODULE + "/view";
				break;
	
				//질문
		case "/" + MODULE +"/questionForm.do":
				// qna/writeForm + .jsp를 이용해서 HTML을 만든다.
				jspInfo = MODULE + "/questionForm";			
				break;	
		
				//질문쓰기
		case "/" + MODULE +"/question.do":
			// service - dao --> request에 저장까지 해준다.
			question(request);
			// 질문 하기 처리 결과 경고 문자 저장
			session.setAttribute("메시지", "질문 등록이 완료 되었습니다");	
			// "qna/view" 넘긴다. -> /WEB-INF/views/ + qna/view + .jsp를 이용해서 HTML을 만든다.
			jspInfo = "redirect:list.do?page=1&perPageNum=" + pageObject.getPerPageNum();			
			break;
	
	
			//답변
		case "/" + MODULE +"/answerForm.do":
			jspInfo = MODULE + "/answerForm";			
			break;	
	
		case "/" + MODULE +"/answer.do":
			answer(request);
			session.setAttribute("메시지", "답변 등록 완료.");
			jspInfo = "redirect:list.do?page=1&perPageNum=" + pageObject.getPerPageNum();			
			break;
			// 삭제 
			case "/" + MODULE +"/delete.do":
				// service - dao --> request에 저장까지 해준다.
				delete(request);
				// 질문/답변 삭제 하기 처리 결과 경고 문자 저장
				session.setAttribute("메시지", "질문/답변이 정상적으로 삭제되었습니다.");
			
				// 공지 list.do로 자동으로 이동
				jspInfo = "redirect:list.do?page=1&perPageNum=" + pageObject.getPerPageNum();			
				break;	
		default:
			throw new Exception("페이지 오류 404 - 존재하지 않는 페이지입니다.");
		}
		
		return jspInfo;
	}
		
	//리스트처리
			private void list(HttpServletRequest request, PageObject pageObject) throws Exception {
			// 기본 정보 셋팅

			// DB에서 데이터 가져오기
			@SuppressWarnings("unchecked")
			List<QnaVO> list
			= (List<QnaVO>) ExeService.execute(Beans.getService(AuthorityFilter.url), pageObject);

			// 서버 객체에 저장
			request.setAttribute("list", list);
			
			//list넘기기
			}
			// qna보기 
			public void view(HttpServletRequest request) throws Exception {	
			
				String strNo = request.getParameter("no");
				Long no = Long.parseLong(strNo);
				// DB에서 데이터 가져 오기.
				QnaVO vo = (QnaVO) ExeService.execute(Beans.getService(AuthorityFilter.url), new Long[]{no});

				// 서버객체에 저장
				request.setAttribute("vo", vo);
			}
		//질문
			public void question(HttpServletRequest request) throws Exception {
			// 자바
			// 넘어오는 데이터 받기
				// 자바
				// 넘어오는 데이터 받기
				String title = request.getParameter("title");
				String content = request.getParameter("content");
		
				// VO 객체를 생성하고 저장해 놓는다.
				QnaVO vo = new QnaVO();
				vo.setTitle(title);
				vo.setContent(content);
				vo.setId(id);

				// DB 저장 처리 : jsp - service - dao - DB
				ExeService.execute(Beans.getService(AuthorityFilter.url), vo);

}
			//답
			public void answer(HttpServletRequest request) throws Exception {
				String strNo = request.getParameter("no");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				// 아이디 session에서 받아 오기
				String id = ((LoginVO) session.getAttribute("login")).getId();
				String strRefNo = request.getParameter("refNo");
				String strOrdNo = request.getParameter("ordNo");
				String strLevNo = request.getParameter("levNo");

				// VO 객체를 생성하고 저장해 놓는다.
				QnaVO vo = new QnaVO();
				//번호(no)는 insert시 시퀀스를 사용한다. 넘겨 받은 번호는 부호번호로 셋팅
				vo.setTitle(title);
				vo.setContent(content);
				vo.setId(id);
				vo.setRefNo(Long.parseLong(strRefNo));
				vo.setOrdNo(Long.parseLong(strOrdNo) + 1); // 관련글번호가 같고 순서번호가 같거나 큰 것의 순서번호는 1증가 우선한다.
				vo.setLevNo(Long.parseLong(strLevNo) + 1);
				vo.setParentNo(Long.parseLong(strNo)); // 번호(no)는 insert시 시퀀스를 사용한다. 넘겨 받은 번호는 부호번호로 셋팅

				ExeService.execute(Beans.getService(AuthorityFilter.url), vo);

		//		response.sendRedirect("list.do");
}
			//삭제
			private void delete(HttpServletRequest request) throws Exception {
				String strNo = request.getParameter("no");
				long no = Long.parseLong(strNo);
				String url = request.getServletPath();
				int result = (Integer) ExeService.execute(Beans.getService(url), no);
				if(result ==0 ) throw new Exception("- 질문답변 게시판 글삭제 오류 - 존재하지 않는 글은 삭제할 수 없습니다.");
			}

}