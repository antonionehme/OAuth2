<%@ taglib prefix="authz"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:url value="/" var="base" />
<link type="text/css" rel="stylesheet"
	href="${base}webjars/bootstrap/3.0.3/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${base}webjars/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript"
	src="${base}webjars/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>tonr</title>
</head>
<body>
	<div id="navbar" class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="http://localhost:8080/tonr2/index.jsp">
				Ministry of Transport</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="${base}index.jsp" class="selected">home</a></li>
				<authz:authorize ifNotGranted="ROLE_USER">
					<li><a href="${base}login.jsp">login</a></li>
				</authz:authorize>
				<li><a href="${base}sparklr/photos">sparklr pics</a></li>
				<!--<li><a href="${base}facebook/info">facebook friends</a></li>-->
			</ul>
		</div>
	</div>

	<div class="container">

		<h1>Welcome to the Ministry of Transport!</h1>

		<p>
			In order to process your inquiries, you are required to share your personal identifier with us.  Please Authorize the request to retrieve a photo of your identifiers. Your credentials wil never be shared with us.
		</p>

		<!--<p>Tonr.com has only two users: "marissa" and "sam". The password
			for "marissa" is password is "wombat" and for "sam" is password is
			"kangaroo".</p> -->

		<authz:authorize ifNotGranted="ROLE_USER">
			<p>
				<a href="<c:url value="login.jsp"/>">Proceed</a>
			</p>
		</authz:authorize>
		<authz:authorize ifAllGranted="ROLE_USER">
			<p>
				<a href="<c:url value="/sparklr/photos"/>">View my Sparklr
					photos</a>
			</p>
			<p>
				<form action="${base}logout" method="post">
					<fieldset>
						<button class="btn btn-primary" type="submit" style="display:none;">Logout</button>
						<input type="hidden" name="${_csrf.parameterName}"
							   value="${_csrf.token}" />
					</fieldset>
				</form>
			</p>
		</authz:authorize>

	</div>
</body>
</html>