<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>热点话题</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link href='http://fonts.googleapis.com/css?family=Kelly+Slab'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css" />


</head>
<body>
	<!-- navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<button type="button" class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="brand" href="#">热点话题</a>
				<div class="nav-collapse collapse">
					<c:choose>
						<c:when test="true">
							<ul class="nav pull-right">
								<li class="active"><a href="#"><i class="icon-user icon-white""></i>ming zhou</a></li>
								<li><a href="#"><i class="icon-edit icon-white""></i></a></li>
								<li><a href="#"><i class="icon-envelope icon-white""></i></a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<form class="navbar-form pull-right">
								<input class="span2" type="text" placeholder="Email"> <input
									class="span2" type="password" placeholder="Password">
								<button type="submit" class="btn btn-primary">登录</button>
								<a href="#" class="btn btn-primary">注册</a>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- navbar end -->
	<!-- body -->
	<div class="container-fluid">
		<h2 class="ss-subtitle">Codrops Timeline</h2>
		<div id="ss-links" class="ss-links">
		</div>
		<div id="year-links" class="year-links">
			<a href="#">2013年</a>
			<a href="#">2012年</a>
			<a href="#">2011年</a>
		</div>
		<div id="ss-container" class="ss-container"></div>
	
	</div>
	<!-- body end -->
</body>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/modernizr.custom.11333.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/util.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/fn.js"></script>
<script id="eventTmpl" type="text/x-fn-tmpl">
		<#var tempMonth = 0;#>
		<#for(var i=0,l=data.length;i<l;i++){#>
				<#var month = getMonth(data[i].startTime); if(tempMonth!=month){#>
					<div class="ss-row">
                    <div class="ss-left">
                        <h2 id="<#=month#>"><#=month#></h2>
                    </div>
                    <div class="ss-right">
                        <h2><#=getYear(data[i].startTime)#></h2>
                    </div>
                	</div>
					
				<#tempMonth = month;}#>
 				<#switch(i%3){#>
					<#case 0:#>
						<div class="ss-row ss-medium">
						<#break;#>
					<#case 1:#>
						<div class="ss-row ss-large">
						<#break;#>
					<#case 2:#>
						<div class="ss-row ss-small">
					<#break;#>
				<#}#>
					<#if(i%2==0){#>
                		<div class="ss-left">
							<a href="http://tympanus.net/Tutorials/ScrollbarVisibility/" class="ss-circle ss-circle-1">Scrollbar Visibility with jScrollPane</a>
                    	</div>
                		<div class="ss-right">
                        	<h3>
                          	  	<span><#=getYMD(data[i].startTime)#></span>
                         	    <a href="#"><#=data[i].name#></a>
                        	</h3>
                    	</div>
					<#}else{#>
                		<div class="ss-left">
                        	<h3>
                          	  	<span><#=getYMD(data[i].startTime)#></span>
                         	    <a href="#"><#=data[i].name#></a>
                        	</h3>
                    	</div>
                		<div class="ss-right">
							<a href="http://tympanus.net/Tutorials/ScrollbarVisibility/" class="ss-circle ss-circle-2">Scrollbar Visibility with jScrollPane</a>
                    	</div>
					<#}#>
                	</div>

				<#}#>
		</script>

<script type="text/javascript">
	//初始化模版引擎
	var tmplOpts = {
		varName : 'data',
		compiler : 'rapid'
	};
	fn.template.setting(tmplOpts);

	function getEventsByDate(ymd) {
		$.ajax({
			type : "get",
			url : '${pageContext.request.contextPath}/getEventsByYear.do?time='
					+ new Date().getTime(),
			dataType : 'json',
			data : {
				date : ymd
			},
			success : function(result) {
				var data = result[0];
				setMonthLink(data);
				var html = fn.template($('#eventTmpl').html())(data);
				$('.ss-container').html(html);
				importTimeLineJ();
			}
		});
	}
	getEventsByDate("2013-1-1");

	//导入js
	function importTimeLineJ() {
		var script = document.createElement('script');
		script.src = '${pageContext.request.contextPath}/js/timeline.js';
		script.type = 'text/javascript';
		var head = document.getElementsByTagName('head').item(0);
		head.appendChild(script);
	}

	function setMonthLink(data) {
		var ss_links = $("#ss-links");
		ss_links.html("");
		var tempMonth = 0;
		for ( var i = 0, l = data.length; i < l; i++) {
			var month = getMonth(data[i].startTime);
			if (tempMonth != month) {
				tempMonth = month;
				var html = "<a href=#"+tempMonth+">" + tempMonth + "月</a>";
				ss_links.append(html);
			}
		}

	}
</script>
</html>
