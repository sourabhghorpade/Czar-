
<%@page import="beans.User"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Loading</title>
</head>
<body>
	Loading Please Wait......
	<%
	
	String S = request.getParameter("button");
	if (S.equals("Register"))
		{
		try 
		{
			String password = request.getParameter("npass");
			String username = request.getParameter("id");
			String name = request.getParameter("fname");
			String contactNumber=request.getParameter("number");
			String year =request.getParameter("radio_year");
			User.register(username, password, name, year, contactNumber);
			%>
			<script>
			window.location.replace("home.jsp?msg=You have successfully registered.");
			</script>
			<% 
		}
		catch (SQLException e) 
			{
				System.out.println(e.getLocalizedMessage());
			%>
			<script>
			window.location.replace("home.jsp?msg=You are NOT Registered.");
			</script>
			<%
			}
		catch (Exception e) 
			{
			%>
			<script>
			window.location.replace("home.jsp?msg=System is unable to Register you currently.Please call a volunteer.");
			</script>
			<%
			}
		} 
	else 
		{
		String username = request.getParameter("username");
		String passsword = request.getParameter("password");
		try
		{
			User user=new User(username,passsword);
			session.setAttribute("user",user);
			%>
			<script>
			window.location="rules.jsp";
			</script>
			<%
		}
		catch(SQLException exception)
			{
				%>
				<script>				
				   window.location.replace("home.jsp?msg=Invalid Username/Password!!!");
				</script>
				<%
			}
		catch(ClassNotFoundException excption1)
			{
				%>				
				<script>				
				   window.location.replace("home.jsp?msg=Invalid Username/Password!!!");
				</script>
				<%
			}
		}
		%>
			
</body>
</html>