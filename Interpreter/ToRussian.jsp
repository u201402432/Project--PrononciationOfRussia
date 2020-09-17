<%@page import="com.memetix.mst.language.Language"%>
<%@page import="com.memetix.mst.translate.Translate"%>
<%@page import="java.util.*"%>

<%!String result = "" ;%>
<%
	// 한글로 입력된 문자열을 받아온다.
	String str = request.getParameter("korean_text");
	
	// MS API를 이용하기 위해 신청한 ID와 SECRET_CODE를 변수에 저장
	String id = "JDMD" ;
	String secret = "ODsTB4TtDuG9WEb/huZa6oZRe1ruNdd7NbmMNcv+HvE=" ;

	// 번역 API를 사용하기 위해 인증하는 과정
	Translate.setClientId("JDMD");
	Translate.setClientSecret("ODsTB4TtDuG9WEb/huZa6oZRe1ruNdd7NbmMNcv+HvE=");

	try
	{
		// 받아온 문자열이 null일 경우를 처리해 주고 Translate.execute 함수로 번역한 값을 가져오는 부분
		if(str != null)
			result = Translate.execute(str, Language.AUTO_DETECT, Language.RUSSIAN);

	}	
	catch (Exception e)
	{	
		e.printStackTrace();
	}
	
	// 번역한 결과를 넘겨주고 러시아어 발음을 만들기 위해 prononciationOfRussia.jsp로 이동
	request.setAttribute("result", result);
    RequestDispatcher dispatcher = request.getRequestDispatcher("prononciationOfRussia.jsp");
    dispatcher.forward(request, response);
%>
	