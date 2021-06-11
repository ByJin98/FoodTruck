<%@page import="com.java.db.dao.PagingListDao"%>
<%@page import="com.java.db.dto.PaginationDto"%>
<%@page import="com.java.db.dao.PagingCountDao"%>
<%@page import="com.java.db.dao.ReviewDao"%>
<%@page import="com.java.db.dto.ReviewDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.java.db.dao.MenuDao"%>
<%@page import="com.java.db.dto.MenuDto"%>
<%@ page import="com.java.db.dao.ShopInfoDao"%>
<%@ page import="com.java.db.dto.ShopInfoDto"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>


<head>


<style type="text/css">
.shop {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	/* border: 1px solid rgba(0, 0, 0, 0.125);
  border-radius: 0.25rem; */
}
</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Shop_info Page</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/star-rating.css">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<script>
	function PageMove(page, shop_num) {
		location.href = "shop_info.jsp?shop_num=" + shop_num + "&page=" + page;
	}
</script>

</head>

<body>
	<%!String S_name, S_intro;
	Double S_score, S_areax, S_areay;
	String num;%>

	<%
		ShopInfoDto S_dto = new ShopInfoDto();
	ShopInfoDao S_dao = new ShopInfoDao();

	num = request.getParameter("shop_num");
	S_dto = S_dao.shopinfo(num);

	S_name = S_dto.getShopName();
	S_intro = S_dto.getShopIntro();
	S_score = S_dto.getShopScore();
	S_areax = S_dto.getShopAreaX();
	S_areay = S_dto.getShopAreaY();
	%>
	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		
		<h1 class="mt-4 mb-3">가게 정보</h1>
		
		<!-- row -->
		<div class="row">

			<!-- Post Content Column -->
			<div class="col-md-8">

				<!-- 가게 메인 사진 -->
				<div class="shop mb-4">
				<%if(null==S_dto.getShopimg()){ %>
				<img class="img-fluid rounded" src="http://placehold.it/700x400" alt="">
				<%}else {%>
				<img class="img-fluid rounded" src=<%=S_dto.getShopimg()%> alt="">
				<%} %>
				<form action="uploadOK.jsp?shop_num=<%=num%>" method="post" enctype="multipart/form-data" >
				<div class = "text-right">	
					<input type = "file" name = "test"><input type="submit" value="업로드">
				</div>
				</form>
					<!-- 가게 정보 표시 -->
					<div class="shop md-4">
						<div class="shop-body">
							<hr>


							<h5 style="text-align: center;">
								<b><%=S_name%></b>
							</h5>
							<hr>

							<h4>
								<b>상세 정보</b>
							</h4>
							<br>
							<h5>
								<b>가게소개</b>
							</h5>
							<h5>
								=><%=S_intro%></h5>
							<h5>
								평점 :<%=S_score%></h5>
							<h5>
								가게x좌표 :<%=S_areax%></h5>
							<h5>
								가게y좌표 :<%=S_areay%></h5>
							<hr>

						</div>
					</div>

					<!-- 댓글창 -->
					<%
					//날짜 표시
					Date now = new Date();
					SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
					String today = sf.format(now);
					%>

					<form action="../ReviewCheck" method="post">
						<input type="hidden" name="shop_num" value="<%=num%>">
						<div class="card my-3">
							<h5 class="card-header">
								코멘트 &nbsp;&nbsp;<%=today%></h5>
							<div class="card-body">

								<div class="form-group">
									<textarea class="form-control" name="comment" rows="3"></textarea>
								</div>
								<!-- 별점 -->
								<div class="pt-3">
									<h5>별점</h5>
									<input id="input-2" name="rating" class="rating rating-loading"
										data-min="0.5" data-max="5" data-step="0.5" value="2"
										data-size="sm">
								</div>
								<script src="js/rating.js"></script>
								<button type="submit" class="btn btn-primary">글쓰기</button>
							</div>
						</div>
					</form>
					<!-- 페이징 -->
					<%!
					int listcnt, startpage, endpage;
					int pages;
					int range = 1;
					%>

					<%
					PaginationDto P_dto = new PaginationDto();
					PagingCountDao Pcount_dao = new PagingCountDao();
					PagingListDao Plist_dao = new PagingListDao();

					pages = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
					P_dto.setListCnt(Pcount_dao.pagingcount(num));
					listcnt = P_dto.getListCnt();

					P_dto.pageInfo(pages, range, listcnt);

					startpage = P_dto.getStartPage();
					endpage = P_dto.getEndPage();
					%>

					<!-- 댓글 -->
					<%!
					int review_num = 0;
					Double review_score = null;
					String review_date = null;
					String review_comment = null;
					String review_id = null;
					%>
					
					<%
					ArrayList<ReviewDto> R_dtos = new ArrayList<ReviewDto>();
					PagingListDao R_pagingdao = new PagingListDao();
					ReviewDao R_dao = new ReviewDao();

					R_dtos = R_pagingdao.paginglist(num, P_dto.getPage(), 5);
					%>

					<div class="card mb-4">

						<%
						for (int i = 0; i < R_dtos.size(); i++) {
						%>

						<%
						review_id = R_dtos.get(i).getMemberId();
						review_date = R_dtos.get(i).getReviewDate();
						review_score = R_dtos.get(i).getreviewScore();
						review_comment = R_dtos.get(i).getReviewComment();
						%>
						<div class="card-body">
							<h5 class="mt-0"><%=review_id%> | <%=review_date%> | <%=review_score%></h5>
							<h5><%=review_comment%></h5>
						</div>
						<hr>

						<%
						}
						%>

						<!-- 페이징 -->

						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">이전</span>
							</a></li>

							<c:forEach var="i" begin="<%=startpage%>" end="<%=endpage%>"
								step="1">
								<li class="page-item"><a class="page-link" href="javascript:PageMove(${i }, <%=num %>)"><c:out value="${i }" /></a></li>
							</c:forEach>

							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">다음</span>
							</a></li>
						</ul>
					</div>
					<!-- 메뉴  -->
					<div class="card my-4">
						<h5 class="card-header">
							<b>가게 메뉴 </b>
						</h5>
						<div class="card-body">
							<%!
							String M_name, M_intro;
							int M_num, M_price;
							%>

							<%
							ArrayList<MenuDto> M_dtos = new ArrayList<MenuDto>();
							MenuDao M_dao = new MenuDao();
							M_dtos = M_dao.menuinfo(num);
							%>
							<!-- 메뉴출력 -->
							<table class="table">
								<tr>
									<th>메뉴번호</th>
									<th>메뉴이름</th>
									<th>메뉴가격</th>
									<th>메뉴소개</th>
								</tr>
								<%
								for (int i = 0; i < M_dtos.size(); i++) {
								%>
								<%
								M_num = M_dtos.get(i).getMenuNum();
								M_name = M_dtos.get(i).getMenuName();
								M_price = M_dtos.get(i).getMenuPrice();
								M_intro = M_dtos.get(i).getMenuIntro();
								%>
								<tr>
									<td><%=M_num%></td>
									<td><%=M_name%></td>
									<td><%=M_price%></td>
									<td><%=M_intro%></td>
									<%
									}
									%>
								</tr>
							</table>
						</div>
					</div>

				</div>
				<!-- /.Post Content Column -->

			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->
	</div>
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>