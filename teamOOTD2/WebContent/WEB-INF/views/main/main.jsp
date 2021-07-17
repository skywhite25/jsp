<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#OOTD</title>
<style type="text/css">
#layer_popup { width:400px; height:500px; text-align:center; position:relative; background: #666699; }
.close div{float:left; text-align:right;}
#check{font-size:12px; position:absolute; bottom:9px; right:45px; color:#fff;}
#close{font-size:12px; position:absolute; bottom:9px; right:10px; color:#fff; }
#close a { color:#eee; }
#top{
	position: absolute;
	right: 70px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script type="text/javascript">
    function setCookie( name, value, expiredays ) {
        var todayDate = new Date();
        todayDate.setDate( todayDate.getDate() + expiredays ); 
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
    }
    function closePop() {
        if ( document.pop_form.chkbox.checked ){
            setCookie( "maindiv", "done" , 1 );
        }
        document.all['layer_popup'].style.visibility = "hidden";
    }
    cookiedata = document.cookie;   
    if ( cookiedata.indexOf("maindiv=done") < 0 ){     
        document.all['layer_popup'].style.visibility = "visible";
    }
    function goTop(){
    	$('html').scrollTop(0);
    }
</script>
</head>
<body>
<div class="container">
<h1>ㅎㅇㅎㅇ</h1>
<p>ㅎㅇㅎㅇ</p>
</div>
<div id="layer_popup" style="visibility: visible;">
    <p>제목</p>
  
    <p>본문</p>
    <div class="close">
        <form name="pop_form">
            <div id="check"><input type="checkbox" name="checkbox" value="checkbox" style="margin-right:5px;">오늘 하루동안 보지 않기</div>
            <div id="close" style="margin:auto;"><a href="javascript:closePop();">닫기</a></div>
        </form>
    </div>
</div>
<button type="button" id="top" onclick="goTop()" class="content_top" role="button" aria-pressed="false">맨 위로 ↑</button>
</body>
</html>