<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%

String id = request.getParameter("id");
String pw = request.getParameter("pw");

// 받은 데이터를 VO 객체이 저장을 한다.(한개를 넘겨야 해서)
LoginVO vo = new LoginVO();
vo.setId(id);
vo.setPw(pw);

// DB 처리 - 아이디, 이름, 등급번호, 등급이름을 가져온다.
// jsp - service - dao

if(id.equals("test")){
	
}
%>