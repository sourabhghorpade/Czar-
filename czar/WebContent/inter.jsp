<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Please Wait</title>
</head>
<body>
<jsp:useBean id="user" class="beans.User" scope="session">
</jsp:useBean>
<jsp:useBean id="ques" class="beans.Question" scope="session">
</jsp:useBean>
Loading next Question...Please Wait
<%
String time=request.getParameter("timer1");
user.settime(time);
String option=request.getParameter("ops");
user.update_info();
ques.setFlag(2);
%>
<script>
window.location="question.jsp?ops=<%out.print(option);%>"
</script>
</body>
</html>