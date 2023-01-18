<%--
  Created by IntelliJ IDEA.
  User: imcvk
  Date: 17/01/23
  Time: 11:33 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Logout</title>
</head>
<body>
<%
  session.invalidate();
%>
<h1>User logged out</h1>
<a href="index.jsp">HomePage</a>
</body>
</html>
