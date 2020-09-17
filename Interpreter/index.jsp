<%! String result = "" ; %>

<!DOCTYPE html>
<html>

	<head>
	
		<title>Korean To Russian</title>
		<link rel="stylesheet" type="text/css" href="main.css">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<%
		// 결과값을 가져온다.
		result = (String) request.getAttribute("result_rus") ;
		
		// 처음 웹을 시작했을 경우 결과값이 없기 때문에 result의 값을 ""로 바꾸어 준다.
		if(result == null)
			result = "" ;
		else	// 번역한 결과값이 있을 경우 result에 저장하여 화면에 띄울 수 있도록 한다.
			result = result + "\n\n" + (String) request.getAttribute("result_kor") ;
		%>

	</head>

	<body>
		
		<div id='main_title'>
			<h1 class='big_text'>Korean To Russian Interpreter</h1>
		</div>
		<div id='left_img'>
			<img src="img/left_korea.jpg"/>
		</div>

		<div id='russia_img'>
			<img src="img/russia.png"/>
		</div>
		<div id='right_img'>
			<img src="img/russia_build.jpg"/>
		</div>
			
		<div id='korean'>
			<textarea id="korean_text" name="korean_text" maxlength="200" size="200" style="display:none;"></textarea>
		</div>
		
		<div id='russian'>
			<textarea id="russian_text" name="russian_text" readonly ><%=result%></textarea>
		</div>
		
		<div id="form">
				<FORM ACTION=ToRussian.jsp METHOD=POST>
				<textarea id="korean_text" name="korean_text" 
				maxlength="200" size="200" placeholder="한글을 입력하고 화살표를 누르세요." autofocus></textarea>
				<INPUT TYPE="image" id="trans_bt" src="img/trans_bt.png">
				</FORM>
		</div>

		<div id='korea_img'>
			<img src="img/taegeukgi.jpg"></img>
		</div>
		
		
	</body>
	
</html>


