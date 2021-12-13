<%@ page import="java.util.Objects" %>
<%! private int number = 3; %>
<%! private long blkTime; %>

<center>
<a href='index.jsp'><img src="users-group.png" alt="home page"></a>
<table cellspacing="20">
<tr>
<td></td>
<td>
	<a href='login.jsp'> <h1>Login</h1> </a></td><td>
</td>
<td>
	<a href='registration.jsp'> <h1>Registration</h1> </a>
</td></tr>
</table>
</center>

<%
//String form="<form action='login.jsp'><input type='text' name='login'/><input type='text' name='password'/><input type='submit' name='SEND'/></form>";

	boolean isShowForm = true;
	long unblkTime = 7000;
	
	String login=request.getParameter("login");
	String password=request.getParameter("password");
	String result = "";

	if(!Objects.isNull(login)) {
		String rez = "<font color='%s'>access %s</font>";
		String color = "red";
		String access="denied";
		if(Objects.equals(login,"admin@gmail.com") && Objects.equals(password,"123456"))
			{
				isShowForm = false;
				access = "allowed";
				color = "green";
				number = 3;
			} else {
				number--;
			}
		// out.write("login: " + login + "; password: " + password);
		result = String.format(rez,color,access);	
	}
	
	if(number < 1) {
		if(number == 0) {
			blkTime = System.currentTimeMillis();
		}
		unblkTime += blkTime;
		if(System.currentTimeMillis() < unblkTime) {
			isShowForm = false;
		result = "is Blocked for:" + (unblkTime-System.currentTimeMillis())/1000;
		} else {
			number = 3;
			result = "";
		}
	}
	
	if(isShowForm) {
	%>
	<center>
	<form action='login.jsp' method='post'>
	<table align="center">
	<tr><td>login(e-mail)</td><td><input type='text' name='login'/></td></tr>
	<tr><td>password</td><td><input type='password' name='password'/></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td><td></td><td><input type='submit' name='SEND'/></td></tr>
	</table>
	</form>
	</center>
	<%
	}
out.write("<center>" + result + "</center>");
if(number > 0 && number < 3){
	out.write("<center><br>" + number + " attempts left</center>");
}
%>