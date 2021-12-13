<%@ page import="java.util.Objects" %>
<%@ page import="java.util.regex.Pattern" %>


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
boolean isShowForm = true;
String login = request.getParameter("login");
String password = request.getParameter("password");
String repassword = request.getParameter("repassword");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String address = request.getParameter("address");
String comment = request.getParameter("comment");
String agree = request.getParameter("agree");
String errorText = "<ul>";
errorText += "</ul>";
boolean isError = false;

String emailFormat = "^[-!#$%&'*+/0-9=?A-Z^_a-z{|}~](\\.?[-!#$%&'*+/0-9=?A-Z^_a-z{|}~])*@[a-zA-Z](-?[a-zA-Z0-9])*(\\.[a-zA-Z](-?[a-zA-Z0-9])*)+$";
Pattern emailPattern = Pattern.compile(emailFormat);

String passwordFormat = "^.*(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).*$";
Pattern passwordPattern = Pattern.compile(passwordFormat);

if(!Objects.isNull(login)) {
	if(login.length()<1) {
		isError = true;
		errorText += "<li> login is empty </li>";
	} 

	if(!emailPattern.matcher(login).matches()) {
		isError = true;
		errorText += "<li> email is incorrect </li>";		
	}

	if(password.length()<1) {
		isError = true;
		errorText += "<li> password is empty </li>";
	}

	if(!passwordPattern.matcher(password).matches()) {
		isError = true;
		errorText += "<li> password is incorrect </li>";		
	}

	if(repassword.length()<1) {
		isError = true;
		errorText += "<li> repassword is empty </li>";
	}

	if(!Objects.equals(password,repassword)) {
		isError = true;
		errorText += "<li> password and repassword do not match </li>";
	}

	if(name.length()<1) {
		isError = true;
		errorText += "<li> name is empty </li>";
	}

	if(Objects.isNull(gender) || gender.length()<1) {
		isError = true;
		errorText += "<li> gender is empty </li>";
	}

	if(address.length()<1) {
		isError = true;
		errorText += "<li> address is empty </li>";
	}

	if(comment.length()<1) {
		isError = true;
		errorText += "<li> comment is empty </li>";
	}

	if(Objects.isNull(agree)) {
		isError = true;
		errorText += "<li> agree is empty </li>";
	}

	if(!isError) {
		out.write("Registration success");
		isShowForm = false;
	}
}

if(isShowForm) {
%><center>
<table><tr><td>
<form action='' method='post'>
<table>
<tr><td>login(e-mail)</td><td><input type='text' name='login' value='<%=login==null?"":login%>'/></td></tr>
<tr><td>password</td><td><input type='password' name='password' value='<%=login==null?"":password%>'/></td></tr>
<tr><td>re-password</td><td><input type='password' name='repassword' value='<%=login==null?"":repassword%>'/></td></tr>
<tr><td>name</td><td><input type='text' name='name' value='<%=login==null?"":name%>'/></td></tr>
<tr><td>gender</td><td>M <input type='radio' name='gender' value='male' <%=(Objects.equals(gender,"male")?"checked":"")%>/> F <input type='radio' name='gender' value='female' <%=(Objects.equals(gender,"female")?"checked":"")%>/></td></tr>
<tr><td>address</td><td><select name='address'>
<option value='UA' <%=(Objects.equals(address, "UA")?"selected":"")%>>UA</option>
<option value='FN' <%=(Objects.equals(address, "FN")?"selected":"")%>>FN</option>
<option value='PL' <%=(Objects.equals(address, "PL")?"selected":"")%>>PL</option>
</select>
</td></tr>
<tr><td>comment</td><td><textarea rows='10' cols='25' name='comment' value='<%=login==null?"":comment%>'></textarea></td></tr>
<tr><td>I agree to install</td><td><input type='checkbox' name='agree'/></td></tr>
<tr><td></td><td></td><td><input type='submit' name='SEND'/></td></tr>
</table>
</form>
</td><td><%
out.write(errorText);
%>
</td>
</tr></table>
<%
}

%>