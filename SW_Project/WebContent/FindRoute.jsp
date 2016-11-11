<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./controlsBox.css">
<link rel="stylesheet" type="text/css" href="./container.css">
<title>전기차 충전소 길찾기</title>
</head>
<!-- html이 로드되면 불러오는 함수 -->
<body onload="initAutocomplete();">
<div id="container">
	<div id="panel">
		<div id="input">
		<form name="mapReport" method="">
			<input id="start" class="controls" type="text" placeholder="출발지 입력"/><br>
			<input id="end" class="controls" type="text" placeholder="도착지 입력"/><br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="search" type="button" value="길찾기" align="right"/>
		</form>
		</div>
	</div>
	<div id="map">
	</div>
</div>

<!-- script를 head에 넣으니 지도가 안나와서 뒤에다가 넣음 -->
<script type="text/javascript" src="./googleMap.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDzSxu3U2IPozDGoSGu6rI9jz3oQhb5pGQ&libraries=places&callback=initAutocomplete" async defer></script>
</body>
</html>