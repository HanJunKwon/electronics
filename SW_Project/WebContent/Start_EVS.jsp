<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./controlsBox.css">
<!-- <link rel="stylesheet" type="text/css" href="./container.css"> -->
<style>
.controls {
	margin-top: 10px;
	border: 1px solid transparent;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	height: 32px;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#start {
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	margin-left: 12px;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 152px;
}

#start:focus {
	border-color: #4d90fe;
}

#end {
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	margin-left: 12px;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 152px;
}

#end:focus {
	border-color: #4d90fe;
}

.pac-container {
	font-family: Roboto;
}

#type-selector {
	color: #fff;
	background-color: #4d90fe;
	padding: 5px 11px 0px 11px;
}

#type-selector label {
	font-family: Roboto;
	font-size: 13px;
	font-weight: 300;
}
</style>
<title>Insert title here</title>

<link rel="stylesheet" href="../css/layout.css" type="text/css">
<link rel="stylesheet" href="../css/controls.css" type="text/css">


<!-- 
<script language="javascript">
	function goPopup1() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function goPopup2() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("jusoPopup2.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack1(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr1.value = roadFullAddr;
		document.getElementById("roadFullAddr1").value = roadFullAddr;
		/* 		document.form.roadAddrPart1.value = roadAddrPart1;
		 document.form.roadAddrPart2.value = roadAddrPart2;
		 document.form.addrDetail.value = addrDetail; */
	}
	function jusoCallBack2(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr2.value = roadFullAddr;
		document.getElementById("roadFullAddr2").value = roadFullAddr;
		/* 		document.form.roadAddrPart1.value = roadAddrPart1;
		 document.form.roadAddrPart2.value = roadAddrPart2;
		 document.form.addrDetail.value = addrDetail; */
	}

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new google.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	//지도를 생성합니다    
	var map = new google.maps.Map(mapContainer, mapOption);

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new google.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder
			.addr2coord(
					document.getElementById("end").value,
					function(status, result) {

						// 정상적으로 검색이 완료됐으면 
						if (status === google.maps.services.Status.OK) {

							var coords = new google.maps.LatLng(
									result.addr[0].lat, result.addr[0].lng);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new google.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new google.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">출발지</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					})

	function googleapisView() {
		var address = encodeURIComponent(document
				.getElementById("start").value);
		var geocode = "http://maps.googleapis.com/maps/api/geocode/json?address="
				+ address + "&sensor=false";
		jQuery
				.ajax({
					url : geocode,
					type : 'POST',
					success : function(myJSONResult) {
						if (myJSONResult.status == 'OK') {
							var tag = "";
							var i;
							for (i = 0; i < myJSONResult.results.length; i++) {
								tag += "주소 : "
										+ myJSONResult.results[i].formatted_address
										+ " <br />";
								tag += "위도 : "
										+ myJSONResult.results[i].geometry.location.lat
										+ " <br />";
								tag += "경도 : "
										+ myJSONResult.results[i].geometry.location.lng
										+ " <br />";
							}
							document.getElementById("message").innerHTML = tag;
						} else if (myJSONResult.status == 'ZERO_RESULTS') {
							alert("지오코딩이 성공했지만 반환된 결과가 없음을 나타냅니다.\n\n이는 지오코딩이 존재하지 않는 address 또는 원격 지역의 latlng을 전달받는 경우 발생할 수 있습니다.")
						} else if (myJSONResult.status == 'OVER_QUERY_LIMIT') {
							alert("할당량이 초과되었습니다.");
						} else if (myJSONResult.status == 'REQUEST_DENIED') {
							alert("요청이 거부되었습니다.\n\n대부분의 경우 sensor 매개변수가 없기 때문입니다.");
						} else if (myJSONResult.status == 'INVALID_REQUEST') {
							alert("일반적으로 쿼리(address 또는 latlng)가 누락되었음을 나타냅니다.");
						}
					}
				});
	}
	googleapisView();
</script>
 -->

</head>
<body onload="initAutocomplete();">
<div id="container">
	<div id="panel">
		<div id="input">
		<form name="mapReport" method="">
			출발지: <input id="start" class="controls" type="text" placeholder="출발지 입력"/><a href="#" id=BTN_END><img
									src="image/search.png" style="height: 22px;" 조회 버튼" class="search_btn" /></a><br>
			도착지: <input id="end" class="controls" type="text" placeholder="도착지 입력"/><a href="#" id=BTN_END><img
									src="image/search.png" style="height: 22px;" 조회 버튼" class="search_btn" /></a><br><br>
		</form>
		</div>
		<input type="button" href="map" target="Right.jsp" size="20"
							onclick="addMarker.setMap(map)" name="OK"
							value="　　  확   　　　   인  　　" />
	</div>
	<div id="map">
	</div>
</div>

<!-- script를 head에 넣으니 지도가 안나와서 뒤에다가 넣음 -->
<script type="text/javascript" src="./googleMap.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDzSxu3U2IPozDGoSGu6rI9jz3oQhb5pGQ&libraries=places&callback=initAutocomplete" async defer></script>
</body>
</html>