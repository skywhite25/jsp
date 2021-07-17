<%@page import="com.OOTD.util.file.FileUtil"%> 
<%@page import="com.OOTD.main.controller.Beans"%>
<%@page import="com.OOTD.util.filter.AuthorityFilter"%>
<%@page import="com.OOTD.main.controller.ExeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 자바부분
// 넘어오는 데이터 받기
String strNo = request.getParameter("no");
String strPerPageNum = request.getParameter("perPageNum");
String deleteFile = request.getParameter("deleteFile");

System.out.println("/image/delete.jsp [no] : " + strNo);
System.out.println("/image/delete.jsp [perPageNum] : " + strPerPageNum);
System.out.println("/image/delete.jsp [deleteFile] : " + deleteFile);

Long no = Long.parseLong(strNo);

// DB에서 데이터 삭제하기
ExeService.execute(Beans.getService(AuthorityFilter.url), no);

// 이미지 파일 지우기
FileUtil.remove(request.getServletContext().getRealPath("/") + deleteFile);

// 자동으로 리스트로 이동하기 - 페이지:1, 한 페이지당 데이터 갯수:넘겨받은 데이터 사용
response.sendRedirect("list.jsp?page=1&perPageNum=" + strPerPageNum);
%>