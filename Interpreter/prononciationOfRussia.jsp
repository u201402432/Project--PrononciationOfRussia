<%! String result = "" ; %>
<%
	result = (String) request.getAttribute("result") ;
	if(result == null)
		result = "" ;
	
	//러시아어 모음
	char[] vowel = {'А', 'а', 'Е', 'е', 'Ё', 'ё', 'И', 'и','Й', 'й', 'О', 'о', 'У',
				'у','Ы', 'ы', 'Ь', 'ь', 'Э', 'э', 'Ю', 'ю', 'Я', 'я'} ;	
	//한글의 초성
	char[] cho = {'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 
				'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'} ;
	//한글의 중성
	char[] jun = {'ㅏ', 'ㅐ', 'ㅑ', 'ㅒ', 'ㅓ', 'ㅔ', 'ㅕ', 'ㅖ', 'ㅗ', 'ㅘ', 
				'ㅙ', 'ㅚ', 'ㅛ', 'ㅜ', 'ㅝ', 'ㅞ', 'ㅟ', 'ㅠ', 'ㅡ', 'ㅢ', 'ㅣ'} ;
	//한글의 종성
	char[] jon = {'ㄱ','ㄲ','ㄳ','ㄴ','ㄵ','ㄶ','ㄷ','ㄹ','ㄺ','ㄻ',
				'ㄼ','ㄽ','ㄾ','ㄿ','ㅀ','ㅁ','ㅂ','ㅄ','ㅅ','ㅆ','ㅇ','ㅈ','ㅊ','ㅋ','ㅌ','ㅍ','ㅎ'};
	//한글의 모음
	char[] kor_vowel = {'ㅏ', 'ㅏ', 'ㅖ', 'ㅖ', 'ㅛ', 'ㅛ', 'ㅣ', 'ㅣ','ㅣ', 'ㅣ','ㅗ', 'ㅗ', 'ㅜ',
				'ㅜ', 'ㅣ', 'ㅣ', 'ㅢ', 'ㅢ', 'ㅣ', 'ㅣ', 'ㅠ', 'ㅠ', 'ㅑ', 'ㅑ'} ;	
	//러시아어 자음
	char[] consonant = {'Б','б', 'В', 'в', 'Г', 'г', 'Д', 'д', 'Ж', 'ж', 'З', 'з',
				'К', 'к', 'Л', 'л', 'М','м', 'Н', 'н',
				'П', 'п', 'Р', 'р', 'С', 'с', 'Т', 'т',
				'ф','Ф', 'Х', 'х', 'Ц','ц','Ч','ч', 'Ш','ш',
				'Щ', 'щ'} ;
	//한글의 자음
	char[] kor_consonant = {'ㅃ','ㅃ', 'ㅂ', 'ㅂ', 'ㄱ', 'ㄱ', 'ㄷ', 'ㄷ', 'ㅈ', 'ㅈ', 'ㅉ', 'ㅉ',
				'ㅋ', 'ㅋ', 'ㄹ', 'ㄹ', 'ㅁ','ㅁ', 'ㄴ', 'ㄴ',
				'ㅍ', 'ㅍ', 'ㄹ', 'ㄹ', 'ㅅ', 'ㅅ', 'ㄸ', 'ㄸ',
				'ㅍ','ㅍ', 'ㅎ', 'ㅎ', 'ㅅ','ㅅ','ㅊ','ㅊ', 'ㅅ','ㅅ',
				'ㅊ', 'ㅊ'} ;
	
	// 러시아어로 번역된 문자열을 char 배열로 변환
	char[] rus = result.toCharArray() ;
	
	// 모음인지 판단한 결과를 저장하는 배열
	boolean[] vow = new boolean[rus.length] ;
	boolean isVowel = false ;
	
	// 결과값을 저장할 문자열을 정의함
	String kor = "" ;

	// 문법에 맞추어 발음을 설정하기위해 우선 러시아어가 모음인지를 판단하여 저장하는 부분
	for(int i=0 ; i<rus.length ; i++){

		for(char x : vowel){
			if(x==rus[i]){
				isVowel = true ;
				break ;
			}
		}
		
		vow[i] = isVowel ;
		
		isVowel = false ;
	}
	
	// 분리된 한글 자음 모음을 저장할 배열. 러시아어보다 많은 문자가 나오기 때문에 배열을 크게 잡는다.
	char[] kor_cell = new char[rus.length*2] ;

	int index = 0 ;
	boolean isnotchar = true ; // char가 문자인지 판단하는 boolean 변수
	
	//러시아어를 한글의 자음 모음으로 변환시키는 부분

	for(int i=0 ; i<rus.length ; i++){
		
		// 문장의 가장 앞의 경우
		if(i==0){
			// 문장 가장 앞의 모음은 ㅇ을 붙여 준다.
			if(vow[i]){
				kor_cell[index] = 'ㅇ' ;
				index ++ ;
				// ㅇ을 추가한 이후에 러시아어 발음과 같은 한글 모음을 찾아 char배열에 추가하는 부분
				for(int j=0 ; j<vowel.length ; j++)
					if(rus[i] == vowel[j]){
						kor_cell[index] = kor_vowel[j] ;
						kor_cell[index+1] = ' ' ;
						isnotchar = true ;
						index += 2 ;
						break ;
					}
			}
			else{
				// 첫번째 러시아 알파벳이 자음일 경우 같은 발음의 한글 자음을 찾아 배열에 추가
				for(int j=0 ; j<consonant.length ; j++)
					if(rus[i] == consonant[j]){
						kor_cell[index] = kor_consonant[j] ;
						index ++ ;
						break ;
					}
			}
		}
		else{	// 문장 가장 앞이 아닐경우
			if(vow[i]){	//모음의 경우
				//앞의 문자가 모음이면서 특수문자가 아닌경우
				if(vow[i-1] || rus[i-1]==' ' || rus[i-1]=='.' || rus[i-1] == ',' && isnotchar){
					// 한글의 ㅇ을 추가해주는 부분
					kor_cell[index] = 'ㅇ' ;
					index ++ ;
					// 러시아알파벳과 같은 모음을 찾아 배열에 추가하는 부분
					for(int j=0 ; j<vowel.length ; j++)
						if(rus[i] == vowel[j]){
							kor_cell[index] = kor_vowel[j] ;					
							kor_cell[index+1] = ' ' ;
							isnotchar = true ;
							index += 2 ;
							break ;
						}
				}
				else{	// 앞의 문자가 자음일 경우 바로 모음을 추가해 준다.
					for(int j=0 ; j<vowel.length ; j++)
							if(rus[i] == vowel[j]){
								kor_cell[index] = kor_vowel[j] ;					
								kor_cell[index+1] = ' ' ;
								isnotchar = true ;
								index += 2 ;
								break ;
							}
				}
			}
			else{	//자음일 경우
				// 쓸모가 사라진 isnotchar를 true로 초기화
				isnotchar = true ;
				if(!vow[i-1]){	// 앞의 러시아 알파벳이 자음일 경우 
						if(index!=0)	// 모음 ㅡ를 붙여주어야 한다.
							if(kor_cell[index-1]!=' '){
								kor_cell[index] = 'ㅡ' ;
								index ++ ;
							}
				}
				// 이후 한글 자음을 다음 배열에 추가해 준다.
				for(int j=0 ; j<consonant.length ; j++){
					if(rus[i] == consonant[j]){
						kor_cell[index] = kor_consonant[j] ;
						index++ ;
						isnotchar = false ;
						break ;
					}				
				}
				// 만약 러시아 알파벳이 아닌경우 공백을 추가해 준다.
				if(isnotchar){
					kor_cell[index] = ' ' ;
					index++ ;
				}
			}
		
		}

	}
	
	// 완성된 한글 자음 모음을 합성하는 부분
	for(int i=0 ; i<kor_cell.length ; i++){
		// 초성과 중성의 index를 -1로 초기화
		int fir = -1 ;
		int sec = -1 ;
		
		// 공백이 아닌 자음이 나올때까지 반복하여 index를 높이는 부분
		while(kor_cell[i] == ' ' ){
			if(kor_cell[i+1] == ' ')
				kor = kor + " " ;
			i++ ;
		}
		// 우선 문자와 초성배열의 원소중 일치하는 index값을 찾아 fir에 저장
		for(int j=0 ; j<cho.length ; j++){
			if(kor_cell[i] == cho[j]){
				fir = j ;
				i++ ;
				break ;
			}
		}
		
		// 문자와 중성배열의 원소중 일치하는 index값을 찾아 sec에 저장
		for (int j=0 ; j<jun.length ; j++){
			if(kor_cell[i] == jun[j]){
				sec = j ;
				break ;
			}
			
		}
		
		// 문자가 아닐경우를 판단하는 부분
		if(fir == -1 && sec == -1)
			break ;
		
		// 한글 자음 모음을 조합하는 과정
		char temp = (char)( 0xAC00+28*21*(fir)+28*(sec) ) ;
		// 최종 결과 문자열에 추가
		kor = kor.concat(String.valueOf(temp)) ;
		
	}
	// 러시아어와 발음 결과물을 다음 페이지로 넘기는 부분
	request.setAttribute("result_rus", result);
	request.setAttribute("result_kor", kor);
	// index.jsp 로 이동하여 결과물을 출력시킨다.
    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
    dispatcher.forward(request, response);
%>
