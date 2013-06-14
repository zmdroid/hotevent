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
<title>热点话题详细页</title>
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
.span8{
	height:550px;
	background:#FFF;
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
		<div class="row-fluid">
    		<div class="span8">
    			<div>
    				<p>${eventVO.cause }</p>
    				<p class="pull-right">
						<button class="btn btn-mini btn-primary" type="button">关注事件</button>
						<button class="btn btn-mini btn-primary" type="button">转发微博</button>
					</p>
    			</div>
    			<div>
	    			<hr/>
    			</div>
    		</div>
    		<div class="span4">
    		</div>
  		</div>
	</div>
	<!-- body end -->
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/util.js"></script>

<script type="text/javascript">

</script>
</html>
