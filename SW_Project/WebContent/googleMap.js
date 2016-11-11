var start_lat; //출발지의 위도
var strat_len; //도착지의 위도
var end_lat; // 출발지의 위도
var end_len; // 도착지의 위도

// 구글맵을 생성하는 함수
function initAutocomplete() {
	// 초기 구글맵화면
	var map = new google.maps.Map(document.getElementById('map'), {
		center : {
			lat : -33.8688,
			lng : 151.2195
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
