/**
 * 
 */
var CommonJS={};

function CommonClass(){
	// #region callAjax - ajax 호출 함수
	// 사용법 : callAjax('Service/GetFirstAddress.aspx','POST',{},function)
	// (responseText){do something};
	this.callAjax = function(url, type, data, callbackSuccess, callbackFailure){
		$.ajax({
			url: url,
			type: type,
			data: data,
			dataType:'json',
			async : false,
			beforeSend: function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX","true");
			},
			success : function(response, status, xhr) {
				if(callbackSuccess != null){
					callbackSuccess(response, status, xhr);
				}
			},
			error : function(xhr, status, errorThrown){
				if(callbackFailure != null){
					callbackFailure(xhr +  status + errorThrown);
				} else {
					alert("Error ("+xhr.status+") ["+ errorThrown+"]");
					console.log("Error ("+xhr.status+") ["+ errorThrown+"]");
					/*$("#infoDialog-text").text("ERROR ("+ xhr.status + ")" + errorThrown);*/
					/*$("#infoDialog").dialog("open");*/
					callbackFailure(xhr +  status + errorThrown);
				}
			}
		});
	};
	// #endregion
	
	this.callSyncAjax = function(url, type, data, callbackSuccess, callbackFailure) {
		$.ajax({
			url: url,
			type: type,
			data: data,
			dataType:'json',
			async : false,
			beforeSend: function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX","true");
			},
			success : function(response, status, xhr) {
				if(callbackSuccess != null){
					callbackSuccess(response, status, xhr);
				}
			},
			error : function(xhr, status, errorThrown){
				if(callbackFailure != null){
					callbackFailure(xhr, status, errorThrown);
				} else {
					alert("Error ("+xhr.status+") ["+ errorThrown+"]");
					/*$("#infoDialog-text").text("ERROR ("+ xhr.status + ")" + errorThrown);
					$("#infoDialog").dialog("open");*/
				}
			}
		});
	};
	
	this.callSubmitAjax = function(url, formName, callbackSuccess, callbackFailure) {
		/*var form = $("#"+formName)[0];
		var formData = new FormData(form);
		console.log("1");*/
		$.ajax({
			url: url,
			/*processData: false,
			contentType: false,*/
			processData: true,
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: $("#"+formName).serialize(),
			type:'POST',
			datatype : 'json',
			beforeSend: function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX","true");
			},
			success : function(response, status, xhr) {
				if(callbackSuccess != null){
					callbackSuccess(response, status, xhr);
				}
			},
			error : function(xhr, status, errorThrown){
				if(callbackFailure != null){
					callbackFailure(xhr, status, errorThrown);
				} else {
					alert("Error ("+xhr.status+") ["+ errorThrown+"] 에러");
					/*$("#infoDialog-text").text("ERROR ("+ xhr.status + ")" + errorThrown);
					$("#infoDialog").dialog("open");*/
				}
			}
		});
	};
	
	this.callSubmitAjaxFile = function(url, formName, callbackSuccess, callbackFailure) {
		var form = $("#"+formName)[0];
		var formData = new FormData(form);
		console.log("1");
		$.ajax({
			url: url,
			processData: false,
			contentType: false,
			/*processData: true,
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',*/
			data: formData,
			type:'POST',
			//datatype : 'json',
			beforeSend: function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX","true");
			},
			success : function(response, status, xhr) {
				if(callbackSuccess != null){
					callbackSuccess(response, status, xhr);
				}
			},
			error : function(xhr, status, errorThrown){
				if(callbackFailure != null){
					callbackFailure(xhr, status, errorThrown);
				} else {
					alert("Error ("+xhr.status+") ["+ errorThrown+"] 에러");
					/*$("#infoDialog-text").text("ERROR ("+ xhr.status + ")" + errorThrown);
					$("#infoDialog").dialog("open");*/
				}
			}
		});
	};
}

this.CommonJS = new CommonClass();