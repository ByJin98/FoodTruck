<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import = "com.java.db.dao.SManagerInfoDao" %>	
<%@page import = "com.java.db.dto.SManagerInfoDto" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>



		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=34c55d8cdebc3f1d7c40139f7c31e99d"></script>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
		<!-- services 라이브러리 불러오기 -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
		<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>



<style type="text/css">
#searchbtn {
	margin: 0px 130px 0px 0px;
}
</style>
</head>
  <script>
    function openPosition(){
   if (navigator.geolocation) {
            

            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {
               
               var areaX = position.coords.latitude; // 위도
               var areaY = position.coords.longitude; // 경도

       
               location.href=('shop_open_process.jsp?areaX=' + areaX + "&areaY="+ areaY);
       
               
            });

         } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
            var error = "실패했습니다"; 
         }
    }

   </script>
<body>
<%
	String mId = (String)session.getAttribute("member_id");   //사업자
	String sId = (String)session.getAttribute("shop_id");   //이용자		 
%>

	<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">거리에서</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
 
      <div class="collapse navbar-collapse" id="navbarResponsive">
      
        <ul class="navbar-nav xs-auto">
	
          <%if (mId == null && sId == null) { %>
          <li class="nav-item">
            <a class="nav-link" href="login_main.jsp">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="signup_main.jsp">회원가입</a>
          </li>
         <li class="nav-item">
			<form action="map.jsp">
				<button type="submit" class="btn btn-light">지도</button>
			</form>
          </li>
          
          <!-- 사장님 로그인 -->
          <%}else if(sId != null){ %>
          <li class="nav-item">
            <a class="nav-link" href="myinfo.jsp"><%=sId %>님</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout_process.jsp">로그아웃</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout_process.jsp">가게관리</a>
          </li>
    	
		  <li class="nav-item">
			<form action="map.jsp">
				<button type="submit" class="btn btn-light">지도</button>
			</form>
          </li>
      	 <li>

				<input type="button" class="btn btn-info" onclick="openPosition()" value = "영업시작">		
		
          </li>
            
 		 <li>
			<form action="shop_close_process.jsp">
				<button type="submit" class="btn btn-info">영업종료</button>
			</form>
          </li>
          <!-- 이용자 로그인 -->
          <%}else if(mId != null){ %> 
          <li class="nav-item">
            <a class="nav-link" href="myinfo.jsp"><%=mId %>님</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout_process.jsp">로그아웃</a>
          </li>
    	<li class="nav-item">
            <a class="nav-link" href="shop_info.jsp">가게정보</a>
          </li>
    	
		  <li class="nav-item">
			<form action="map.jsp">
				<button type="submit" class="btn btn-light">지도</button>
			</form>
          </li>
       
          <%} %>
      
        </ul>
     	<ul class="navbar-nav ml-auto xs-auto">
        	<li class="nav-item">
     				<form class="form-inline " method = "get" action ="map.jsp">
     					 <div class="input-group">
     	 				 <input class="form-control col-xs-8 col-sm-8 col-md-8 col-lg-8 " type="text" placeholder="검색" name = "search">
     	 				 <span class="input-group-append">
      	 				   <input type="submit" class="btn btn-secondary"  value = "검색"/>
      	 				 </span>
      	 				 </div>
     				</form>
     		</li>
     	</ul>
      </div>
    </div>
  </nav>
</body>
</html>
