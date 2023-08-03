<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<c:url value='/js/jquery-3.5.1.min.js' />"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	hello
	<input type="button" value="text" id="test"/>
</body>
<script>
$("#test").click(function(){
	console.log("jqueryTest");
	$.ajax({
		url: "/ajaxTest.do",
		type: "GET",
		data: {
				"name" : "LIS" ,
				"test" : "Success"
			},
		dataType: 'json',
		success : function (res){
			console.log("success");
			console.log(res);
		},
		error : function (res) {
			console.log("erorr");
			console.log(res);
		}
	})
})
</script>
</html>