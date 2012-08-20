<%@ page language="java" import="java.util.Random,java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Question</title>

<style type="text/css">

.s_info_bar
{
width:300px;
height:30px;
border:solid;
border-width:thin;
border-color:#999;
border-radius:5px;
position:relative;
float:right;
margin-left:15px;
border-top:none;
text-align:center;
color:black;
}

#session_info
{
width:960px;
height:40px;
margin-top:-20px;
position:relative;
left:50%;
margin-left:-490px;
}

#q_box
{
position:relative;

left:50%;margin-left:-480px;width:960px;border-style:solid;margin-top:20px;border-width:thin;border-color:#999;
border-left:none;
border-right:none;
}

#a_box
{
	width:960px;
	position:relative;
	margin-top:20px;	
	padding: 15px;	
	margin-bottom:70px;
}

#submit_ans
{
width:200px;
height:50px;
float:right;
}

#submit_ans input
{
width:120px;
height:30px;
left:50%;
position:relative;
margin-left:-60px;
top:50%;
margin-top:-15px;
background-color: #29761F;
border-radius:5px;
color:white;

	-webkit-box-shadow: 0px 0px 10px black;
	-ms-box-shadow: 0px 0px 10px black;
	-o-box-shadow: 0px 0px 10px black;
	-moz-box-shadow: 0px 0px 10px black;
	box-shadow: 0px 0px 10px black;

	-webkit-transition: all 0.6s ease;
	-ms-transition: all 0.6s ease;
	-moz-transition: all 0.6s ease;
	-o-transition: all 0.6s ease;
}

#submit_ans input:hover
{
cursor:pointer;
background-color: #3FB42E;
}

#header input
{
background-color:maroon;
border-radius:5px;
color:white;

	-webkit-box-shadow: 0px 0px 10px black;
	-ms-box-shadow: 0px 0px 10px black;
	-o-box-shadow: 0px 0px 10px black;
	-moz-box-shadow: 0px 0px 10px black;
	box-shadow: 0px 0px 10px black;

	-webkit-transition: all 0.6s ease;
	-ms-transition: all 0.6s ease;
	-moz-transition: all 0.6s ease;
	-o-transition: all 0.6s ease;
}

#header input:hover
{
cursor:pointer;
background-color:red;
}
</style>


</head>

<body onload="start()">
<jsp:useBean id="user" class="beans.User" scope="session">
</jsp:useBean>

<jsp:useBean id="ques" class="beans.Question" scope="session">
</jsp:useBean>
<div id="bodycontent">

	<div id="header">

	<div id="logo"><img src="ascilogo.png" height="150"></div><!-- End logo div-->

	<b><%=user.getYr() + " Test"%></b>
	<div style="position:relative;clear:right;float:right;padding-right:20px;"><br><input type="submit"  name="next" value="End Test" onclick="return ty()"></div>

	</div><!-- End header div-->

<%
{
	if(ques.getFlag()==1)
	{
		String S = request.getParameter("next");
		if (S.equals("New Test")) 
		{
			user.setMin(20);
			user.setSec(0);
			user.update_info();
		}
	}
	boolean correct=false;
	if(ques.getFlag()==2)
	{
		//Has come from this page itself so evaluate the answer
		String s=request.getParameter("ops");
		String s2=ques.getAnswer();
		if(s.equals(s2))
			{
			correct=true;
			}
		user.check_answer(correct, ques.getQues_level());
	}
	
while(!ques.generate_ques(correct));
}
%>
<script>
function start()
	{
		
		document.getElementById("timer1").setAttribute("value","<%=user.gettime()%>");
		document.getElementById("timer1").setAttribute("disabled","disabled");
		timer();
	}

function abcd(str)
{
	document.getElementById("ans").innerHTML="Answer is : " + str;	
}
function ty()
{
	window.location="final.jsp";	
}

function butn()
{
	 document.getElementById("haha").innerHTML="submit";
	 
}
function end()
{
	document.form1.timer1.disabled=false; 
}
function timer()
	{
	var s=document.getElementById("timer1").value;
	var arr=s.split(":",s.length);
	var sec=parseInt(arr[1]);
	var min=parseInt(arr[0]);
	if(sec!=0)
	{
		sec--;
	}
	else if(min!=0)
		{
		sec=59;
		min--;
		}
	else
		{
		window.location="final.jsp";
		}
	s=min+":"+sec;
	
    document.getElementById("timer1").setAttribute("value", s);
	setTimeout("timer()",1000);
	}

</script>


<br>
<form method="post" name="form1" id="q" action="inter.jsp">  

<div id="session_info">
<div class="s_info_bar"><b>Time</b><br><input type="text" style="text-align:center;" name="timer1" id="timer1" ></div>
<div class="s_info_bar"><b>Score</b><br><input type="text" style="text-align:center;" value="<%=user.getScore() %>" disabled="disabled"></div>
<div class="s_info_bar"><b>Level</b><br><input type="text" style="text-align:center;" value="<%=ques.getQues_level() %>" disabled="disabled"></div>
</div>

<div id="q_box" >
<div style="width:150px;height:30px;position:relative;left:50%;margin-left:-75px;margin-top:30px;text-align:center;">Question (<%out.print(ques.getTable());%>)</div>
<div style="position:relative;width:800px;left:50%;margin-left:-400px;"><pre><%=ques.getQuestion() %></pre></div>
</div>

<div id="a_box">
<div style="width:750px;border-right:solid thin #999;position:relative;float:left;font-size:20px;">
<input type='radio' name='ops' id='rd1' value='op1' checked='checked'><%=ques.getO1() %><br>
<input type='radio' name='ops' id='rd3' value='op2' ><%=ques.getO2() %><br>
<input type='radio' name='ops' id='rd3' value='op3' ><%=ques.getO3() %><br>
<input type='radio' name='ops' id='rd3' value='op4' ><%=ques.getO4() %>
</div>
<div id='submit_ans'><input type="submit"  name="next" value="Submit Answer" onclick="return end()"></div>
</div>
<br>
</form>

<div id="footer">
	     <p>Developed By : <b>Sourabh Ghorpade</b> - <b>Dhruva Pendharkar</b> - <b>Pankaj Kumar</b><br>Designed by : <b>Apurva Pawar</b></p>
	    <!-- About Czar -->
	  
</div><!-- End footer div-->

</div><!-- end body content -->
</body>
</html>