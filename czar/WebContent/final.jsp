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
try
	{
DatabaseConnection databaseConnection = new DatabaseConnection("stud");
databaseConnection.executeUpdate("delete from Student_MarksPerTest where Student_ID='"+ user.getUsername() + "' and Test_Name='SE_AUGUST_C';");
databaseConnection.executeUpdate("insert into Student_MarksPerTest values('"+user.getUsername()+"','SE_AUGUST_C',"+user.getScore()+");");
databaseConnection.disconnect();
	}
catch(SQLException e)
	{
		e.printStackTrace();
	}
%>
<script type="text/javascript">
window.location="thankyou.jsp"
</script>

</body>
</html>