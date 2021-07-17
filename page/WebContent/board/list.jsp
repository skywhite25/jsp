<%@page import="com.webjjang.main.controller.Beans"%>
<%@page import="com.webjjang.main.controller.ExeService"%>
<%@page import="com.webjjang.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.webjjang.util.PageObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags"%>
<%
// 여기가 자바부분

%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
*{
    margin: 0;
    padding: 0;
    font-family: 'lato';
    list-style: none;
    text-decoration: none;
}
body{
    background-color: #fcdc29;
}

.wrapper{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
.mainMenu{
    width: 250px;
    display: block;
    border-radius: 10px;
    overflow: hidden;
}
.item{
    border-top: 1px solid #ef584a;
    overflow: hidden;
}
.btn{
    display: block;
    padding: 15px 20px;
    background-color: #ff6f61;
    color: #fff;
    position: relative;

}
.btn:before{
    content: '';
    position: absolute;
    width: 0;
    height: 0;
    border-left: 8px solid transparent;
    border-right:8px solid transparent;
    border-top:10px solid #ff6f61;
    right: 15px;
    bottom: -10px;
    z-index: 9;
    
}
.btn i {
    margin-right: 10px;
}
.subMenu{
    background: #273057;
    overflow: hidden;
    transition: max-height 0.7s;
    max-height: 0;
}
.subMenu a{
    display: block;
    padding: 15px 20px;
    color: #fff;
    font-size: 14px;
    border-bottom: 1px solid #394c7f;
    position: relative;
    
}
.subMenu a:before{
    content: '';
    opacity: 0;
    transition: opacity 0.3s;

}
.subMenu a:hover:before{
    content: '';
    position: absolute;
    height: 0;
    width: 6px;
    left: 0;
    top:0;
    opacity: 1;
    /* background-color: #d8d824; */
    border-top: 24px solid transparent;
    border-left: 11px solid #fcdc29;
    border-bottom: 24px solid transparent;
}
.subMenu a:after{
    content: '';
    opacity: 0;
    transition: opacity 0.3s;

}
.subMenu a:hover:after{
    content: '';
    position: absolute;
    height: 0;
    width: 6px;
    right: 0px;
    top:0;
    opacity: 1;
    /* background-color: #d8d824; */
    border-top: 24px solid transparent;
    border-right: 11px solid #fcdc29;
    border-bottom: 24px solid transparent;
}
.subMenu a:hover{
    background: #273057;
    background: -moz-linear-gradient(top, #273057 0%, #273057 50%, #394c7f 51%, #394c7f 100%);
    background: -webkit-linear-gradient(top, #273057 0%,#273057 50%,#394c7f 51%,#394c7f 100%);
    background: linear-gradient(to bottom, #273057 0%,#273057 50%,#394c7f 51%,#394c7f 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#273057', endColorstr='#394c7f',GradientType=0 );
    transition: all 0.3s;
    border-bottom: 1px solid #394c7f;
}
.subMenu a:last-child{
    border:none;
}
.item:target .subMenu{
    max-height: 10em;
}




/*  footer   */
footer {
    background-color: #222;
    color: #fff;
    font-size: 14px;
    bottom: 0;
    position: fixed;
    left: 0;
    right: 0;
    text-align: center;
    z-index: 999;
}

footer p {
    margin: 10px 0;
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida  Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
}
footer .fa-heart{
    color: red;
}
footer .fa-dev{
    color: #fff;
}
footer .fa-twitter-square{
  color:#1da0f1;
}
footer .fa-instagram{
  color: #f0007c;
}
fotter .fa-linkedin{
  color:#0073b1;
}
footer .fa-codepen{
  color:#fff
}
footer a {
    color: #3c97bf;
    text-decoration: none;
  margin-right:5px;
}
.youtubeBtn{
    position: fixed;
    left: 50%;
  transform:translatex(-50%);
    bottom: 45px;
    cursor: pointer;
    transition: all .3s;
    vertical-align: middle;
    text-align: center;
    display: inline-block;
}
.youtubeBtn i{
   font-size:20px;
  float:left;
}
.youtubeBtn a{
    color:#ff0000;
    animation: youtubeAnim 1000ms linear infinite;
  float:right;
}
.youtubeBtn a:hover{
  color:#c9110f;
  transition:all .3s ease-in-out;
  text-shadow: none;
}
.youtubeBtn i:active{
  transform:scale(.9);
  transition:all .3s ease-in-out;
}
.youtubeBtn span{
    font-family: 'Lato';
    font-weight: bold;
    color: #000;
    display: block;
    font-size: 12px;
    float: right;
    line-height: 20px;
    padding-left: 5px;
  
}

}
/* footer  */
</script>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<!-- BootStrap 라이브러리 등록 -->
<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
  
</head>
<body>
    <div class="wrapper">
        <ui class="mainMenu">
            <li class="item" id="account">
                <a href="#account" class="btn"><i class="fas fa-user-circle"></i>My Account</a>
                <div class="subMenu">
                    <a href="">item-1</a>
                    <a href="">item-2</a>
                    <a href="">item-3</a>
                </div>
            </li>
            <li class="item" id="about">
                <a href="#about" class="btn"><i class="fas fa-address-card"></i>About</a>
                <div class="subMenu">
                    <a href="">item-1</a>
                    <a href="">item-2</a>
                </div>
            </li>
            <li class="item" id="support">
                <a href="#support" class="btn"><i class="fas fa-info"></i>Support</a>
                <div class="subMenu">
                    <a href="">item-1</a>
                </div>
            </li>
            <li class="item">
                <a href="#" class="btn"><i class="fas fa-sign-out-alt"></i>Log Out</a>
            </li>
        </ui>
    </div>



<footer>
  <p>
    Created with <i class="fa fa-heart"></i> by
    <a target="_blank" href="https://codepen.io/ahmadbassamemran/">Ahmad Emran</a>
    Follow me : 
      <a target="_blank"  href="https://www.instagram.com/ahmadbassamemran/"><i class="fab fa-instagram"></i></a>
    <a target="_blank"  href="https://www.linkedin.com/in/ahmademarn/"><i class="fab fa-linkedin"></i></a>
    <a target="_blank" href="https://codepen.io/ahmadbassamemran/"><i class="fab fa-codepen"></i></a> 
        <a target="_blank" href="https://dev.to/ahmadbassamemran"><i class="fab fa-dev"></i></a> 
             <a target="_blank" href="https://twitter.com/ahmadbassamemra"><i class="fab fa-twitter-square"></i></a> 
  </p>
</footer>
</body>
</html>