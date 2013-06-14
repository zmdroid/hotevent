<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
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
<title>创建热点话题</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
	background: #f7f7f7 url(../images/old_wall.jpg) repeat top left;
	color: rgba(0, 0, 0, 0.8);
}
</style>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/event.css" />
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
				<a class="brand" href="${pageContext.request.contextPath}/index">热点话题</a>
				<div class="nav-collapse collapse">
					<c:choose>
						<c:when test="true">
							<ul class="nav pull-right">
								<li class="active"><a href="#"><i
										class="icon-user icon-white""></i>ming zhou</a></li>
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
	<div class="container">
			<fieldset>
				<legend>创建新的热点话题</legend>
				<label>发生时间:
					<div class="controls input-append date form_date" data-date=""
						data-date-format="yyyy-MM-dd" data-link-field="dtp_input2"
						data-link-format="yyyy-mm-dd">
						<input id="startTime" size="16" type="text" value="" readonly> <span
							class="add-on"><i class="icon-th"></i></span>
					</div>
				</label>
				<label>
				<textarea id="editor">mingzhou</textarea>
				</label>
				<label>
					<button class="btn btn-primary pull-left" onclick="javascript:createNewEvent()">完成</button>
				</label>
			</fieldset>
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
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/locales/bootstrap-datetimepicker.zh-CN.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/util.js"></script>

<script type="text/javascript">
function createNewEvent(){
	var startTime = $("#startTime").val();
	if(startTime==""){
		alert("时间不能为空");
		return ;
	}
	var content = $("#editor").val();
	$.get("${pageContext.request.contextPath}/createNewEvent.do?t=" + Math.random(),
		{'eventVO.startTime':startTime,'eventVO.cause':content},
		function(rs){
			alert(rs);
			window.location.href = "${pageContext.request.contextPath}/index";
		});
}

</script>
</html>
