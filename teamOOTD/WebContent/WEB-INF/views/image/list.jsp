<%@page import="com.OOTD.image.vo.ImageVO"%>
<%@page import="com.OOTD.util.filter.AuthorityFilter"%>
<%@page import="com.OOTD.main.controller.Beans"%>
<%@page import="com.OOTD.main.controller.ExeService"%>
<%@page import="java.util.List"%>
<%@page import="com.OOTD.util.PageObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags" %>


<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/upload/image/favicon.ico" />

<meta charset="UTF-8">
<title>Trend Page</title>

<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
	border: 0px solid #888;
}

#image_gallery, .line {
	clear: both;
}

.line {
	height: 10px;
}

.actionBtn20 {
	 display: inline-block;
	 position: relative;
	 padding: 9px 20px 10px;
	 margin: auto;
	 border-radius: 100px;
	 -webkit-border-radius: 100px;
	 -moz-border-radius: 100px;
	 transition: transform .35s ease, box-shadow .35s ease;
	 -webkit-transition: transform .35s ease, box-shadow .35s ease;
	 -moz-transition: transform .35s ease, box-shadow .35s ease;
	 text-transform: uppercase;
	 text-decoration: none;
}
.actionBtn20:hover {
	 transform: translateY(-3px);
	 -webkit-transform: translateY(-3px);
	 -moz-transform: translateY(-3px);
	 -ms-transform: translateY(-3px);
	 box-shadow: 1px 5px 10px rgba(0, 0, 0, 0.08);
	 -webkit-box-shadow: 1px 5px 10px rgba(0, 0, 0, 0.08);
	 -moz-box-shadow: 1px 5px 10px rgba(0, 0, 0, 0.08);
}
.actionBtn20 .lb{
	 display: block;
	 font-size: 14px;
	 font-weight: bold;
	 color:#222;
	 font-family: 'Montserrat', sans-serif;
}

@font-face {
font-family: 'Hana_handwriting';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/naverfont_05@1.0/Hana_handwriting.woff') format('woff');
font-weight: normal;
font-style: normal;
}

.f {
	font-family: 'Hana_handwriting';
	font-size: 45px;
}

#btn_group button {  
  	border: 1px solid black;  
  	background-color: rgba(0, 0, 0, 0);  
  	color: black;  
  	padding: 8px;  
  	
  }  
  
#btn_group button:hover { 
 	color:white; 
 	background-color: #4c4c4d; 
}



</style>

<script type="text/javascript">
$(function(){
	$(".dataRow").click(function(){
		//alert("클릭");
		var no = $(this).find(".no").text();
		location = "view.do?no=" + no +"&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}";
	});
	
	// 한 페이지에 보여주는 데이터 선택의 이벤트 처리 -> 변경이 일어나면 처리한다.
	$("#sel_perPageNum").change(function(){
		//alert("값 변경");
		// 다시 리스트 불러오기 - 전달 정보는 1페이지, perPageNum을 선택된 값을 전달한다.
		location = "list.do?page=1&perPageNum=" + $(this).val();
	});
	
	$("#spring").click(function(){
		location = "list.do?seasonNo=1";
	});
	$("#summer").click(function(){
		location = "list.do?seasonNo=2";
	});
	$("#autumn").click(function(){
		location = "list.do?seasonNo=3";
	});
	$("#winter").click(function(){
		location = "list.do?seasonNo=4";
	});
});
</script>

</head>


<body>
<div class="container">
<h1 class="f">Trend Page</h1>
<div style="padding: 10px; border-bottom: 2px solid #eee; height: 75px;">
		<!-- 로그인이 되어 있을 경우 나타낸다. -->
		<c:if test="${login.gradeNo == 9 }">
			<div class="pull-left">
				<a href="writeForm.do?perPageNum=${pageObject.perPageNum }" class="btn btn-default code_view actionBtn20">
					<span class="lb">write</span>
				</a>
			</div>
		</c:if>
		
	<div class="pull-right form-inline">
<!-- 		<label>한 페이지에 표시할 데이터</label> -->
		<select class="form-control" id="sel_perPageNum">
			<option ${(pageObject.perPageNum == 4)?"selected":"" }>4</option>
			<option ${(pageObject.perPageNum == 8)?"selected":"" }>8</option>
			<option ${(pageObject.perPageNum == 12)?"selected":"" }>12</option>
			<option ${(pageObject.perPageNum == 16)?"selected":"" }>16</option>
		</select>
	</div>
	
		<div id="btn_group" align="center">
			<button id="spring">
				<span>spring</span>
			</button>
			<button id="summer">
				<span>summer</span>
			</button>
			<button id="autumn">
				<span>autumn</span>
			</button>
			<button id="winter">
				<span>winter</span>
			</button>
		</div>
</div>
<div class="line"></div>

<div class="line"></div>
	<div id="image_gallery">
		<div class="row">
			<c:forEach items="${list }" var="vo" varStatus="vs">
			<!-- c:forEach 속성 중에서 varStatus="vs" => index나 count를 사용할 수 있는 객체 -->
			<c:if test="${(vs.index > 0) && (vs.index % 4 == 0) }">
				<!-- 인덱스 번호가 0 이상이고 4의 배수이면 한 줄(class="row")을 만든다. -->
		${"</div>"}
		${"<div class='row'>"}
			</c:if>
			
				<!-- BootStrap Grid : 한 줄을 12칸으로 나눠서 운영하는 시스템 -->
			    <div class="col-md-3 dataRow"> <!-- 한 줄을 3등분 한다. -->
			      <div class="thumbnail">
			          <img src="${path }${vo.fileName}" alt="Lights" style="width:100%">
			          <div class="caption f" style="font-size: 40px;">
			            <p>[<span class="no">${vo.no }</span>]</p>
			          </div>
			      </div>
		    	</div>
	    	</c:forEach>
	    </div>
		<div>
			<pageObject:pageNav listURI="list.do" pageObject="${pageObject }" />
		</div>
	</div>
	</div>
</body>
</html>