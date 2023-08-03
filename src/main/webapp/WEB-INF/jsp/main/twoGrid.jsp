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
			<div class="fl-L grid1" align="center" style="width:40%;">
				<div class="srcArea">
					<div class="box__flex" style="height:23px;">
						<span style="font-weight:bold;">사원 정보</span>
					</div>
				</div>
		       	<table id="emp"></table>     
		   	</div>
		   	 <div class="fl-R grid2" align="center" style="width:60%;">
		   	 	<div class="srcArea">
					<div class="box__flex">
						<span style="font-weight:bold;">파트 정보</span>
					</div>
					<div class="box__flex">
						<a href="" class="ml-2">
							<button class="process__btn2">
								<img src="/images/icons/btn_modify.png" class='mr-1' alt="수정" />
								<span>수정</span>
							</button>
						</a> <a href='' class='ml-2'>
							<button class='process__btn2 '>
								<img src="/images/icons/btn_delete_w.png" alt='삭제' /> <span>삭제</span>
							</button>
						</a> <a href="" class="ml-2">
							<button class="process__btn2">
								<img src='/images/icons/btn_add_w.png' class='mr-1' alt='입력' />
								<span>입력</span>
							</button>
						</a> <a href="" class="ml-2">
							<button class="process__btn2">
								<img src="/images/icons/btn_save_w.png" class='mr-1' alt="저장" />
								<span>저장</span>
							</button>
						</a>
					</div>
				</div>
		       	<table id="part"></table>    
		   	</div>    
		</section>
	</div>
<script>
$(".mr-1").on('click', function(e) {
	$('#emp').jqGrid({
	    url: "<c:url value='/empList.do'/>",	// 서버주소 
	    reordercolNames:true,
	     // 보낼 파라미터
	    mtype:'GET',	// 전송 타입
	    datatype : "json",	// 받는 데이터 형태 
	    colNames:['플래그','사번','사원명','입사일','퇴사일'],	//컬럼명
	    colModel:[
	   	 { name: 'iud'		  , index: 'iud'		, width: '20' , align:"center", hidden: true,
		    	 formatter:"select", 
		    	 formatoptions :{value:"N:불용"},
		    	 edittype:"select", 
		    	 editoptions: {value:"N:불용"}   
		    	 },
		     { name: 'sabun'	  , index: 'sabun'    , width: '20' ,align:"center"    , hidden: false}	,				
		     { name: 'sabunNameK'	  , index: 'sabunNameK'	, width: '20'  , align: "center" },
		     { name: 'startDate'	  , index: 'startDate'	, width: '20'  , align: "center" },
		     { name: 'endDate'	  , index: 'endDate'	, width: '20'  , align: "center" }
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
		 var sabunData = $('#emp').jqGrid('getRowData', rowid);
		 var sabun = sabunData.sabun;
		 partList(sabun);
	  }
	  
	})
});

function partList(sabun){
	$('#part').jqGrid({
	    url: "<c:url value='/partList.do?sabun=" + sabun + "'/>",	// 서버주소 
	    reordercolNames:true,
	    mtype:'GET',	// 전송 타입
	    datatype : "json",	// 받는 데이터 형태 
	    colNames:['플래그','파트','파트명','기본','권한', '전문의'],	//컬럼명
	    colModel:[
	   	 { name: 'iud'		  , index: 'iud'		, width: '20' , align:"center", hidden: true,
		    	 formatter:"select", 
		    	 formatoptions :{value:"N:불용"},
		    	 edittype:"select", 
		    	 editoptions: {value:"N:불용"}   
		    	 },
		     { name: 'jundalPart'	  , index: 'jundalPart'    , width: '20' ,align:"center"    , hidden: false},
		     { name: 'partName'	  , index: 'partName'	, width: '20'  , align: "center" },
		     { name: 'defaultPart'	  , index: 'defaultPart'	, width: '20'  , align: "center" },
		     { name: 'partAuthority'	  , index: 'partAuthority'	, width: '20'  , align: "center" },
		     { name: 'mdYn'	  , index: 'mdYn'	, width: '20'  , align: "center" }
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
}

</script>
</body>
</html>