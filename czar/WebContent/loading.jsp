
<%@page import="beans.DatabaseConnection"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Loading</title>
</head>
<body>
	Loading Please Wait......
	<jsp:useBean id="user" class="beans.User" scope="session">
	</jsp:useBean>
	
	 
	<%
	
	DatabaseConnection databaseConnection=new DatabaseConnection("stud");
	String S = request.getParameter("button");
	
	if (S.equals("Register")) {
		try {
			String P = request.getParameter("npass");
			String U = request.getParameter("id");
			String N = request.getParameter("fname");
			String cno=request.getParameter("number");
			String year=request.getParameter("radio_year");
			databaseConnection.executeUpdate("insert into student values ('" + U + "','" + P + "','"+ N +"',0,1,"+cno+ ",'"+year+"',20,0)");
			databaseConnection.disconnect();
			%>
			<script>
			window.location.replace("home.jsp?msg=You are Registered!!!");
			</script>
			<% 
		
		} catch (SQLException e) {
			databaseConnection.disconnect();
			%>
			<script>
			window.location.replace("home.jsp?msg=You are NOT Registered!!!");
			</script>
			<%
		}

	} else 
		{
		String U = request.getParameter("username");
		String P = request.getParameter("password");
		
		try {
			databaseConnection.executeQuery("select * from student where username='"+ U +"' and password='" + P + "'");
			if(databaseConnection.resultSet.next())
			{
								
				user.setUsername(U);
				user.setPassword(P);
				user.setMin(Integer.parseInt(databaseConnection.resultSet.getString("min")));
				user.setSec(Integer.parseInt(databaseConnection.resultSet.getString("sec")));
				user.setName(databaseConnection.resultSet.getString("names"));
				user.setScore(Integer.parseInt(databaseConnection.resultSet.getString("score")));
				user.setCno(databaseConnection.resultSet.getString("cno"));
				user.setYr(databaseConnection.resultSet.getString("yr"));
				databaseConnection.disconnect();
				%>
				<script>
				window.location="rules.jsp";
				</script>
				<% 
			}
			else
			{
				databaseConnection.disconnect();
				  				
				%>				
				<script>				
				   window.location.replace("home.jsp?msg=Invalid Username/Password!!!");
				</script>
				<% 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
%>
</body>
</html>