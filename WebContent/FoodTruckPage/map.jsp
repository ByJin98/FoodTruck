

	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<style>
.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>


<title>Modern Business - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

</head>

<body>
	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<br>

		<!-- Content Row -->
		<!--  <div class="row"> -->
		<!-- Map Column -->
		<!--  <div class="col-lg-8 mb-4"> -->
		<!-- Embedded Google Map -->
		<!-- <iframe style="width: 100%; height: 400px; border: 0;" src="http://maps.google.com/maps?hl=en&amp;ie=UTF8&amp;ll=37.0625,-95.677068&amp;spn=56.506174,79.013672&amp;t=m&amp;z=4&amp;output=embed"></iframe> -->
		<!-- </div> -->
		<!-- Contact Details Column -->

		<!-- 카카오 맵 -->
		<div id="map" style="width: 1000px; height: 400px;"></div>
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
		<script>
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(37.7462521357531, 127.024000986311),
				level : 3
			};

			var map = new kakao.maps.Map(container, options);

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.7462521357531, 127.024000986311), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			//마커 생성

			// 마커가 표시될 위치입니다 
			var markerPosition = new kakao.maps.LatLng(37.7462521357531, 127.024000986311);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);    

			//오른쪽 +,-, 스카이뷰

			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		</script>



		<!-- Contact Details Column -->
		<div class="col-lg-4 mb-4">
			<h3>Contact Details</h3>
			<p>
				3481 Melrose Place <br>Beverly Hills, CA 90210 <br>
			</p>
			<p>
				<abbr title="Phone">P</abbr>: (123) 456-7890
			</p>
			<p>
				<abbr title="Email">E</abbr>: <a href="mailto:name@example.com">name@example.com
				</a>
			</p>
			<p>
				<abbr title="Hours">H</abbr>: Monday - Friday: 9:00 AM to 5:00 PM
			</p>
		</div>
	</div>
	<!-- /.row -->

	<!-- Contact Form -->
	<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->

	<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Contact form JavaScript -->
	<!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

</body>

</html>
