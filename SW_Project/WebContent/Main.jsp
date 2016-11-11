<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>K_EV_Main</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	 <link rel="stylesheet" href="C:\Users\RYUN\workspace\SW_Project\WebContent\assets\css\main.css" />
	 <!--차후 경로는 상대경로로 지정한다-->
	 <style type="text/css">
		 #menu2{width:auto; }
	 	 #menu2 ul{margin:0 ;padding: 0; }
		 #menu2 li{display:inline;}
		 body {
  			background-image:url('image/slogun.PNG');
  			background-repeat : no-repeat;
  			background-position : 50% 0%;
		}
		.button{
   		padding-right: 5%;
   		padding-left: 5%;
		}
	 </style>
<script type="text/javascript">
function fnActionBtn1() {
	document.form1.action = "AboutEV.jsp";
	document.form1.submit();
}
function fnActionBtn2() {
	document.form1.action = "EVStations.jsp";
	document.form1.submit();	
	}
function fnActionBtn3() {
	document.form1.action = "Other.jsp";
	document.form1.submit();
}
function fnActionBtn4() {
	document.form1.action = "Admin.jsp";
	document.form1.submit();
}
</script>
</head>

<body>	

	<center>
		<div align = "center"></div>
		<table width="530px" cellpadding="0px" cellspacing="30px" border="0px">
			<tr>
				<td style="padding:0px 0px 0px 0px">
					<span style="color:#OA6EOA; font-weight:700; font-size:70px; font-family:맑은 고딕; letter-spacing:-5px;
					line-height:1.6; opacity:0.6; position: absolute; width:600px; padding-bottom:5px">
						Go Korea!   Go EV!
					</span>
				</td>
			</tr> 
		</table>	 
		<!--img src ="image/slogun.PNG" style="max-width: 100%; height: auto;" border="0"-->
		<!--차후 경로는 상대경로로 지정한다-->
	</center>
	
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<center>
	<div>
	<form name=form1 method=post action=null>
<!-- 		<span class="button"><input type=button value="전기자동차 란?" onClick="fnActionBtn1();" ></span> -->
		<span class="button"><a href="AboutEV.jsp"><img src="image/About_icon.png"></a></span>
		<span class="button"><a href="EVStations.jsp"><img src="image/EVS_icon.png"></a></span>
		<span class="button"><a href="Other.jsp"><img src="image/Other_icon.png"></a></span>
		<span class="button"><a href="Admin.jsp"><img src="image/Admin_icon.png"></a></span>
	</form>
	</div>

	
	<footer id="footer" class="container">
					
					<div class="row 200%">
						<div class="12u">

							<!-- Contact -->
							<!-- 
								<section>
									<h2 class="major"><span>Get in touch</span></h2>
									<ul class="contact">
										<li><a class="icon_name" href="#"><span class="label">Facebook</span></a></li>
										<li><a class="icon_name" href="#"><span class="label">Twitter</span></a></li>
									</ul>
								</section>
							-->

						</div>
					</div>

				</footer>
	
	</center>	
	
</body>
</html>