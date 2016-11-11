<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDzSxu3U2IPozDGoSGu6rI9jz3oQhb5pGQ"></script>
<!-- 키값 -->
<script>
	
	function getLocation() {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(initialize);
	    }
	}
	<!-- 맵 초기화 -->
	function initialize(position) { 
	  lat = position.coords.latitude;
	  lon = position.coords.longitude;
	  myCenter = new google.maps.LatLng(lat, lon)
	  var mapProp = {	
	    center:myCenter, // map의 중심을 전역변수 myCenter에 정해준 값 사용
	    zoom:16,	//지도 확대 배율 지정(x16)
	    mapTypeId:google.maps.MapTypeId.ROADMAP,
		/*
			mapTypeId는 화면에 표시될 맵 타입을 알려줌
			ROADMAP(normal,default 2D map)->2D맵
			Satellite(photographic map)->포토그래픽 맵
			Hybrid(photographic map+roads and city names)->포토그래픽+도로명과 도시 이름
			Terrain(map width mountains, rivers, etc)-> 산이나 강 등등도 보여줌
		*/
		mapTypeControl:false,
	    navigationControlOptions:{style:google.maps.NavigationControlStyle.SMALL}
	  };
	  //맵 객체 생성
	  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp); //맵의 기본 속성을 정해준 지역변수 mapProp 호출
	
	  
	
	  //마커 생성(마커는 현재 내 위치를 빨간색 아이콘으로 표시해준다)
	  //마커의 용도는 현재 위치가 아니라 매장의 위치를 알려주는 용도로 사용해야될것같다.  
	  var marker = new google.maps.Marker({ 
		position:myCenter,
		/*
			icon:'????.png' 
			를 넣어서 마커의 이미지를 변경할 수있음
		*/
	  });
	  marker.setMap(map);
	  
	  
	  
	  /*
		InfoWindow 함수는 는 마커에 마우스를 올리면 보이는 정보를 보여준다
		DB랑 연동시켜서 매장 정보가 나오도록 해야할듯
	  */
	  var infowindow = new google.maps.InfoWindow({
		content:"접속 위치"
	  });
	  infowindow.open(map,marker);
	  /*
	  위에 infowindow를 클릭하지 안해도 해당 위치에 대한 정보를 텍스트로 제공한다.
	  여기 주석된 거는 해당 마커를 클릭해야지 텍스트 내용을 볼 수있게함
	  google.maps.event.addListener(marker, 'click', function() {
	  infowindow.open(map,marker);
	  });
	  */
	  var homeControlDiv = document.createElement('div');
	  var homeControl = new HomeControl(homeControlDiv, map);
	  map.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv);
	
	}
	
	<!-- 현재 위치로 돌아 올 수 있는 버튼 -->
	function HomeControl(controlDiv, map) {
	  controlDiv.style.padding = '5px';
	  var controlUI = document.createElement('div');
	  controlUI.style.backgroundColor = 'yellow';
	  controlUI.style.border='1px solid';
	  controlUI.style.cursor = 'pointer';
	  controlUI.style.textAlign = 'center';
	  controlUI.title = 'me';
	  controlDiv.appendChild(controlUI);
	  var controlText = document.createElement('div');
	  controlText.style.fontFamily='Arial,sans-serif';
	  controlText.style.fontSize='12px';
	  controlText.style.paddingLeft = '4px';
	  controlText.style.paddingRight = '4px';
	  controlText.innerHTML = '<b>현재 위치<b>'
	  controlUI.appendChild(controlText);
	 
	  google.maps.event.addDomListener(controlUI, 'click', function() {
	    map.setCenter(myCenter)
	  });
	}
	//DomListener는 페이지가 로도드될때 초기화 함수가 실행되게 한다.
	google.maps.event.addDomListener(window, 'load', getLocation);
	
	
	
	
	
	
	
	var start_lat; //출발지의 위도
	var strat_len; //도착지의 위도
	var end_lat; // 출발지의 위도
	var end_len; // 도착지의 위도

	// 구글맵을 생성하는 함수
	function initAutocomplete() {
		// 초기 구글맵화면
		var map = new google.maps.Map(document.getElementByName('map'), {
			center : {
				lat : position.coords.latitude,
				lng :  position.coords.longitude
			},
			zoom : 13,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		});
		
		var start = document.getElementById('start');//출발지 주소를 받는 input 박스를 가저온다.
		var end = document.getElementById('end');//도착지 주소를 받는 input 박스를 가져온다.
		var start_SearchBox = new google.maps.places.SearchBox(start); // 출발지 주소를 받는 input 박스에 구글맵의 기능인 주소자동완성기능을 넣는다
		var end_SearchBox = new google.maps.places.SearchBox(end); // 도착지 주소를 받는 input 박스에 구글맵의 기능인 주소자동완성기능을 넣는다

		// 구글맵에 리스너를 추가한다. 먼지는 잘 모르겠는데 없어서 실행 안되서 남겨둠. 내가 생각할때는 출발지를 검색했을때 해당 위치로 화면을 이동시켜주는 기능같음
		// 출발지와 관련된 리스너
		map.addListener('bounds_changed', function() {
			start_SearchBox.setBounds(map.getBounds());
		});
		
		//마찬가지로 먼지 잘 모르겠는데 없으면 실행안되서 남겨둠
		// 도착지와 관련된 리스너
		map.addListener('bounds_changed', function() {
			end_SearchBox.setBounds(map.getBounds());
		});

		// 배열로 안해도될거같은데 일반 변수로 선언하면 setMap(null)을 어떻게 적용시켜줘야할지 몰라서 배열로 그냥 만듦
		// marker.setMap에서 배열을 null로 바꿔주기  떄문에 실행에는 문제 없음
		// 결론적으로 start_markers[0], end_markers[0]에만 검색한 위치의 정보들만 저장한다.
		var start_markers = []; // 출발지에 정보를 저장할 배열
		var end_markers = []; // 도착지에 정보를 저장할 배열

		// 출발지 입력 텍스트 박스에 대용이 변경되면 호출 되는 함수같음
		start_SearchBox.addListener('places_changed', function() {
			var places = start_SearchBox.getPlaces(); // 출발지에 입력된 장소(값)을 가지고 places에 저장.

			if (places.length == 0) // places의 길이가 0이면 출발지 텍스트 박스에 아무것도 입력이 안된거니 함수 반환(장소를 검색하고 내용을 지울때 호출 될듯)
				return;

			var bounds = new google.maps.LatLngBounds(); // 검색한 장소의 위도와 경로를 반환하는거같음
			places.forEach(function(place) { // 이 함수가 멀 의미하는지는 모르겠는데 그냥 실행되면 아이콘에 대한 설정을 함. 
				var icon = {
					url : place.icon, // 아이콘 이미지 변경할 수 있음(아마 이게 검색하면 학교같은 경우는 엄마랑 아이랑 손 잡고있는 아이콘나오고 식당은 식당아이콘 나오게 구글에서 설정한 아이콘 가저오는거같은데 나중에 커스터마이징할때 바꾸면됨.)
					size : new google.maps.Size(71, 71), // 나머지는
					origin : new google.maps.Point(0, 0), // 머하는
					anchor : new google.maps.Point(17, 34), // 놈들인지
					scaledSize : new google.maps.Size(25, 25) // 모르겠음. 숫자수정하니까 애들이 이상하게 나옴
				};

				// 지금까지 저장된 출발지에 대한 정보를 초기화
				start_markers.forEach(function(marker) {
					marker.setMap(null);
				});

				// 현재 주소에 대한 정보를 push함수를 써서 start_markers배열에 저장(자바스크립트에서 push함수를 제공해줌)
				// 배열처럼 start_markers[0]=...... 이렇게 쓰니까 안되서 그냥 배열로 만들고 push함수쓴거. 결과에는 이상없음
				start_markers.push(new google.maps.Marker({
					map : map, 
					icon : icon,
					title : place.name,
					position : place.geometry.location, // 위도와 경로를 같이 가저와주는 건데 place.geometry.location.lat하면 위도우 메이커, place.geometry.location.lng하면 경도 받아주는거같음 
					zoom : 13
				}));
				
				// 여기 아래있는거는 먼지 모르겠음
				if (place.geometry.viewport) {
					
					bounds.union(place.geometry.viewport);
				} else {
					bounds.extend(place.geometry.location);
				}
			});
			map.fitBounds(bounds);
		});

		// 도착지 입력바에 대한 리스너. 출발지에 대한 리스너에서 변수명 몇개만 바꿨고 동작방식은 똑같음
		end_SearchBox.addListener('places_changed', function() {
			var places = end_SearchBox.getPlaces();

			if (places.length == 0)
				return;

			var bounds = new google.maps.LatLngBounds();
			places.forEach(function(place) {
				var icon = {
					url : place.icon,
					size : new google.maps.Size(71, 71),
					origin : new google.maps.Point(0, 0),
					anchor : new google.maps.Point(17, 34),
					scaledSize : new google.maps.Size(25, 25)
				};

				end_markers.forEach(function(marker) {
					marker.setMap(null);
				});

				// Create a marker for each place.
				end_markers.push(new google.maps.Marker({
					map : map,
					icon : icon,
					title : place.name,
					position : place.geometry.location,
					zoom : 13
				}));

				if (place.geometry.viewport) {
					// Only geocodes have viewport.
					bounds.union(place.geometry.viewport);
				} else {
					bounds.extend(place.geometry.location);
				}
			});
			map.fitBounds(bounds);
		});
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>
	
</head>

<body>
	<!-- 
		지도를 담기위한 div태그 생성 
		높이와 넓이를 %단위로 주니까 지도가 안 나온다. 
		해당 자료는 좀 더 찾아봐야 한다.
	-->
	<div id="googleMap" style="width: 2000px; height: 1000px;"></div>
	<!-- 충전기 Type Overray -->
	<div id="chrgtype">
		<div id="btnOpenClose" style="position:absolute; right:5px; top:7px; width:60px; height:20px;"><span>숨기기</span>&nbsp;<img src="image/arrow-right.png" width="20" height="20" style="vertical-align: middle;" alt="숨기기"/></div>
		<ul>
			<li>
				<div><label for="chrgtype_1"><input type="checkbox" id="chrgtype_1" name="chrgtype_1" class='filterType' value="01" checked title="DC차데모(RAY, Soul, leaf ,아이오닉);"/> DC차데모</label><br><span>(RAY, Soul, leaf ,아이오닉)</span></div>
				<!-- <span>(RAY, Soul, leaf)</span> -->
			</li>
			<li>
				<div><label for="chrgtype_2"><input type="checkbox" id="chrgtype_2" name="chrgtype_2" class='filterType' value="03" checked title="DC차데모 + AC3상(RAY, Soul, leaf, sm3 ,아이오닉...);"/> DC차데모 + AC3상 </label><br><span>(RAY, Soul, leaf, sm3 ,아이오닉... )</span></div>
				<!-- <span>(RAY, Soul, leaf, sm3 ... )</span> -->
			</li>
			<li>
				<div><label for="chrgtype_3"><input type="checkbox" id="chrgtype_3" name="chrgtype_3" class='filterType' value="06" checked title="DC차데모 + AC3상 + DC콤보(RAY, Soul, leaf, sm3, spark, i3 ,아이오닉...);"/> DC차데모 + AC3상 + DC콤보 </label><br><span>(RAY, Soul, leaf, sm3, spark, i3 ,아이오닉... )</span></div>
				<!-- <span>(RAY, Soul, leaf, sm3, spark, i3... )</span> -->
			</li>
		</ul>
	</div><!-- end of chrgtype -->
</body>

</html>