<html>
<head>
<meta charset="UTF-8">
<title>教务管理系统</title>
</head>
<body>
<%
		//response.sendRedirect("login/toLogin");
		request.getRequestDispatcher("/toLogin").forward(request, response);
%>
</body>
</html>