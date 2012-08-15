<%@ page language="java" import="java.sql.*,beans.DatabaseConnection" contentType="text/html; charset=ISO-8859-1"
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
Storing your Result...Please Wait

<%
/*
DatabaseConnection databaseConnection = new DatabaseConnection();
databaseConnection.connect("stud");
databaseConnection.Query="update student set score=" + user.getScore() + " where username='" + user.getUsername() + "'";
databaseConnection.statement.executeUpdate(databaseConnection.Query);
databaseConnection.Query="insert into Student_MarksPerTest values('"+user.getUsername()+"','SE_AUGUST_C',"+user.getScore()+");";
databaseConnection.statement.execute(databaseConnection.Query);
databaseConnection.disconnect();
*/
%>
<script type="text/javascript">
window.location="thankyou.jsp"
</script>

</body>
</html>