<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<select name="ev_car">
					<option value="차량 종류를 선택하세요 ." >차량 종류를 선택하세요 .</option>
					<option value="레이(기아)" >레이(기아)</option>
					<option value="소울(기아)" >소울(기아)</option>
					<option value="스파크(GM)" >스파크(GM)</option>
					<option value="리프(낫산)" >리프(낫산)</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>		
				<input type="text" size="20" name="Road" class="tfs" id="Road" placeholder="대략적인 주행 가능 거리 :  " title="대략적인 주행 가능 거리 " />
			</td>
		</tr>
		<tr>
			<td>		
				<input type="button" size="20" name="OK" value="　　  확   　　　   인  　　" />
			</td>
		</tr>
<!-- 	<tr>
			<td>		
				결과 : <input type="text" size="14" name="input_about_output" class="tfs" id="input_about_output" placeholder="결과 : " title="결과 : " />
			</td>
		</tr>
-->
	</table>
</body>
</html>