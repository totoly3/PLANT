<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
div#head{
        font-size: 40px;
        width: 1600px;
        padding: 50px;
        margin-bottom: 50px;
        border-bottom: 2px solid lightgray;
    }
    
    
    <!-- 섹션 크기 -->
	.bg-light{
		height: 1053px;
		padding-top:55px;
		padding-bottom:75px;
	}
	.flex-fill.mx-xl-5.mb-2{
		margin: 0 auto;
		width : 700px;
		padding-right: 7rem;
		padding-left: 7rem;
	}
	
    <!-- 입력창 -->
	.container.py-4{
		margin: 0 auto;
		width : 503px;
	}
	
    <!-- 가입하기 -->
	.d-grid.gap-2{
		padding-top: 30px;
	}
	
	#id,#pw,#pwc,#name,#phone,#email,#address,#address_detail{
		width: 500px;
	}
	.form-group{
		align="center";
	
	}
</style>


	<!-- 한글폰트 26개 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>
<%-- 	<jsp:include page="/WEB-INF/views/common/mainView.jsp"/> <!--절대경로 --> --%>


	<div class="outer">
		<h1 align="center">회원가입</h1>
		<section class="bg-light">
			 <div class="container py-4">
			 	  <div class="row align-items-center justify-content-between">
		                <a class="navbar-brand h1 text-center" href="index.do">
		                    <span class="text-dark h4"></span> <span class="text-primary h4"></span>                 
		                </a>
				</div>
			<form action="enroll.me" method="post" >
				<!-- 회원가입form안에.txt -->
		
				
			   <div class="form-group">
               		<label for="exampleInputEmail1" class="form-label mt-4">아이디</label>
                    <input type="text" class="form-control" name="MemberId" id="MemberId" placeholder="1~15자의 영문/숫자를 조합하여 입력" >
                	<div class="invalid-feedback" id="checkResult">아이디를 입력하세요</div>
                </div>
				<div class="form-group has-success">
					<label class="form-label mt-4" for="inputValid">비밀번호</label>
					<input type="password" class="form-control" name="MemberPwd" id="MemberPwd" placeholder="1~16자의 영문/숫자를 조합하여 입력">
				</div>	
				<div class="form-group has-danger">
					<label class="form-label mt-4" for="inputInvalid">비밀번호 재확인</label> 
					<input type="password" class="form-control" id="pwc" placeholder="비밀번호 다시 입력">
					<div class="invalid-feedback" id="cp">비밀번호를 입력하세요</div>
				</div>
				 <div class="form-group">
               		<label for="exampleInputEmail1" class="form-label mt-4">이름</label>
                    <input type="text" class="form-control" name="MemberName" id="MemberName" placeholder="이름 입력">
                	<div class="invalid-feedback" id="cn">이름을 입력하세요</div>
                </div>
                  <div class="form-group">
               		<label for="exampleInputEmail1" class="form-label mt-4">핸드폰번호</label>
                    <input type="text" class="form-control" name="MemberPhone" id="MemberPhone" placeholder="핸드폰번호 입력">
                	<div class="invalid-feedback" id="cpn">핸드폰번호를 입력하세요</div>
                </div>
                  
                <div class="d-grid gap-2">
                    <button class="btn btn-primary btn-lg" type="submit" id="enrollBtn" onclick="return register();">가입하기</button>
                	<button type="button" class="btn btn-danger" id="btn-cancel" onclick="location.replace()">취소</button>
                </div>
                
		

				<br>
				<br>
				</form>
			 </div>
		</section>
	</div>
	
	<script>
   
    
	$(function(){
		

		const $idInput = $("#MemberId");
		//input요소 객체에 키가 눌렸다가 떼어질때 발생시키는 function
		$idInput.keyup(function(){
// 			console.log($idInput.val());
		//최소 5글자 이상일 경우에만 중복체크가 진행되게 작업
		
		
		if($idInput.val().length>=3){
			
			$.ajax({
				url : "IdCheck.me",
				data : {MemberId : $idInput.val()},
				success : function(result){
					console.log(result)
					if(result=="YYY"){ //사용불가
						$("#checkResult").css("color","red").text("중복된 아이디가 있습니다. 다시 입력해주세요.");
					}else{//사용 가능
						$("#checkResult").css("color","green").text("멋진 아이디네요!!");
						$("#enrollBtn").attr("disabled",false);
					}
				},
				error : function(){
					console.log("아이디 중복체크 통신 실패");
				}
			})
		}else{//5글자 미만일 경우 
			$("#checkResult").html("5글자 이상 입력해주세요").show();
			
		}
		
		})
		
	
	})
    
    $("#MemberPwd").focusout(function(){
    	let MemberPwd = $('#MemberPwd').val();
    	let pw_rule =  /^[0-9a-zA-Z]\w{1,14}$/;
    	let pwc = $('#pwc').val();
    	
    	if(MemberPwd == ""){
    		$("#cp").html('비밀번호를 입력하세요');
    		$("#MemberPwd").attr("class","form-control is-invalid");
    		$("#pwc").attr("class","form-control is-invalid");
    	}else if(!pw_rule.test(MemberPwd)){
    		$("#cp").html('영문자, 숫자 1~14자만 가능합니다');
    		$("#MemberPwd").attr("class","form-control is-invalid");
    		$("#pwc").attr("class","form-control is-invalid");
    	}else if(pw != pwc){
    		$("#cp").html('비밀번호가 일치하지 않습니다');
    		$("#MemberPwd").attr("class","form-control is-invalid");
    		$("#pwc").attr("class","form-control is-invalid");
    	}else{        		
    		$("#cp").html('');
    		$("#MemberPwd").attr("class","form-control is-valid");
    		$("#pwc").attr("class","form-control is-valid");
    	}
    })
    
    $("#pwc").focusout(function(){
    	let MemberPwd = $('#MemberPwd').val();
    	let pw_rule =  /^[0-9a-zA-Z]\w{1,14}$/;
    	let pwc = $('#pwc').val();
    	
    	if(pw == ""){
    		$("#cp").html('비밀번호를 입력하세요');
    		$("#MemberPwd").attr("class","form-control is-invalid");
    		$("#pwc").attr("class","form-control is-invalid");
    	}else if(!pw_rule.test(MemberPwd)){
    		$("#cp").html('영문자, 숫자 1~14만 가능');
    		$("#MemberPwd").attr("class","form-control is-invalid");
    		$("#pwc").attr("class","form-control is-invalid");
    	}else if(pwc == "" || pw != pwc){
    		$("#cp").html('비밀번호가 일치하지 않습니다');
    		$("#MemberPwd").attr("class","form-control is-invalid");
    		$("#pwc").attr("class","form-control is-invalid");
    	}else{        		
    		$("#cp").html('');
    		$("#MemberPwd").attr("class","form-control is-valid");
    		$("#pwc").attr("class","form-control is-valid");
    	}
    })
    
    $("#MemberName").focusout(function(){
    	let MemberName = $("#MemberName").val();
        let name_rule = /^[가-힣]{2,}$/;
        
        if(MemberName == ""){
    		$("#cn").html('이름을 입력하세요');
    		$("#MemberName").attr("class","form-control is-invalid");
    	}else if(!name_rule.test(MemberName)){
    		$("#cn").html('2글자 이상 한글만 가능합니다');
    		$("#MemberName").attr("class","form-control is-invalid");
    	}else{   		
    		$("#cn").html('');
    		$("#MemberName").attr("class","form-control is-valid");
    	}
    })
    
</script>

</body>
</html>