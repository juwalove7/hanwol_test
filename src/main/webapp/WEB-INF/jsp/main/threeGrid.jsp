<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
/* .ag-body-container {
    display: contents;
} */
</style>
<meta charset="UTF-8">
<title>One Grid</title>
</head>
<body>
	<!-- 검색영역 설정 Start -->
	<div class="inquiry__page-flex mt5" style="overflow-y: auto;">
		<section class="inquiry__search-section">
			<div class="inquiry__search-flex">
				<div class="box__flex">
					<label class="box__label">검색 부분</label> <input type="text"
						id="searchKeyword" name="searchKeyword" value=""
						onkeydown="enter()" />
				</div>
				<div class="box__flex">
					<div class="inquiry__btn-right">
						<a href="javascript:fn_query();">
							<button class="process__btn">
								<img src="/images/icons/btn_search2.png" class='mr-1' alt="조회" />
								<span>조회</span>
							</button>
						</a>
					</div>
				</div>
			</div>
		</section>
		<!-- 검색영역 설정 End -->
		<section class="inquiry__result-section mt5">
			 <div class="fl-L grid1" align="center" style="width:50%;"> <!-- width은 화면에 맞춰서 조절 -->
				<div class="srcArea">
					<div class="box__flex">
						<span style="font-weight:bold;">Grid Title</span>
					</div>
					<div class="box__flex">
						<a href='' class="ml-2">
							<button class='process__btn2'>
								<img src='/images/jqgrid/btn_add_w.png' alt='추가' />
								<span>버튼</span>
							</button>
						</a>
					</div>
				</div>
		       	<table id="list1"></table>
		    </div>
		    
		    <div class="fl-R grid2" align="center" style="width:50%;"> <!-- width은 화면에 맞춰서 조절 -->
				<div class="srcArea">
					<div class="box__flex">
						<span style="font-weight:bold;height:24px;">Grid Title2</span>
					</div>
					<div class="box__flex">
					</div>
				</div>
		       	<table id="list2"></table>
				<div class="srcArea mt5">
					<div class="box__flex">
						<span style="font-weight:bold;height:24px;">Grid Title3</span>
					</div>
					<div class="box__flex">
					</div>
				</div>    
		       	<table id="list3"></table>    
		   	</div>    
		</section>
	</div>
<script>
var gheight = $(".inquiry__result-section").height();
$('#list1').jqGrid({
    url: "<c:url value='/exGrid.do'/>",	// 서버주소 
    reordercolNames:true,
    postData : { 
   	 	 type:"A",								
	 }, // 보낼 파라미터
    mtype:'POST',	// 전송 타입
    datatype : "json",	// 받는 데이터 형태 
    colNames:['플래그','이름','나이'],	//컬럼명
    colModel:[
   	 { name: 'iud'		  , index: 'iud'		, width: '20' , align:"center", hidden: true,
	    	 formatter:"select", 
	    	 formatoptions :{value:"N:불용"},
	    	 edittype:"select", 
	    	 editoptions: {value:"N:불용"}   
	    	 },
	     { name: 'name'	  , index: 'name'    , width: '20' ,align:"center"    , hidden: false}					,
	     { name: 'age'	  , index: 'age'	, width: '80'  , align: "center" }
	     ], //서버에서 받은 데이터 설정
    jsonReader: {
	     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
	     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
	     records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
    },
    autowidth: true,
	shrinkToFit: true,
    height: "auto",//테이블의 세로 크기, Grid의 높이         
  loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때      
  emptyrecords: "Nothing to display",  // 데이터없을떄
  rowNum:-1, 
  rownumbers: true,         
  gridview : true,  // 선표시 true/false         
  loadComplete: function(data){  
      console.log(data);
  },	// loadComplete END   
  onSelectRow: function(rowid) {
     	console.log(rowid)
  }
  
})

<!-- Grid2 -->
$('#list2').jqGrid({
    url: "<c:url value='/exGrid.do'/>",	// 서버주소 
    reordercolNames:true,
    postData : { 
   	 	 type:"A",								
	 }, // 보낼 파라미터
    mtype:'POST',	// 전송 타입
    datatype : "json",	// 받는 데이터 형태 
    colNames:['플래그','이름','나이'],	//컬럼명
    colModel:[
   	 { name: 'iud'		  , index: 'iud'		, width: '20' , align:"center", hidden: true,
	    	 formatter:"select", 
	    	 formatoptions :{value:"N:불용"},
	    	 edittype:"select", 
	    	 editoptions: {value:"N:불용"}   
	    	 },
	     { name: 'name'	  , index: 'name'    , width: '20' ,align:"center"    , hidden: false}					,
	     { name: 'age'	  , index: 'age'	, width: '80'  , align: "center" }
	     ], //서버에서 받은 데이터 설정
    jsonReader: {
	     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
	     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
	     records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
    },
    autowidth: true,
	shrinkToFit: true,
    height: gheight*0.3,//테이블의 세로 크기, Grid의 높이         
  loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때      
  emptyrecords: "Nothing to display",  // 데이터없을떄
  rowNum:-1, 
  rownumbers: true,         
  gridview : true,  // 선표시 true/false         
  loadComplete: function(data){  
      console.log(data);
  },	// loadComplete END   
  onSelectRow: function(rowid) {
     	console.log(rowid)
  }
  
})
<!-- Grid3 -->
$('#list3').jqGrid({
    url: "<c:url value='/exGrid.do'/>",	// 서버주소 
    reordercolNames:true,
    postData : { 
   	 	 type:"A",								
	 }, // 보낼 파라미터
    mtype:'POST',	// 전송 타입
    datatype : "json",	// 받는 데이터 형태 
    colNames:['플래그','이름','나이'],	//컬럼명
    colModel:[
   	 { name: 'iud'		  , index: 'iud'		, width: '20' , align:"center", hidden: true,
	    	 formatter:"select", 
	    	 formatoptions :{value:"N:불용"},
	    	 edittype:"select", 
	    	 editoptions: {value:"N:불용"}   
	    	 },
	     { name: 'name'	  , index: 'name'    , width: '20' ,align:"center"    , hidden: false}					,
	     { name: 'age'	  , index: 'age'	, width: '80'  , align: "center" }
	     ], //서버에서 받은 데이터 설정
    jsonReader: {
	     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
	     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
	     records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
    },
    autowidth: true,
	shrinkToFit: true,
    height: gheight*0.3,//테이블의 세로 크기, Grid의 높이         
  loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때      
  emptyrecords: "Nothing to display",  // 데이터없을떄
  rowNum:-1, 
  rownumbers: true,         
  gridview : true,  // 선표시 true/false         
  loadComplete: function(data){  
      console.log(data);
  },	// loadComplete END   
  onSelectRow: function(rowid) {
     	console.log(rowid)
  }
  
})
</script>
</body>
</html>