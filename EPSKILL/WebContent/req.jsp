<%@ page import="java.sql.*" %>
<%

String username =(String)session.getAttribute("uname");
String res = request.getParameter("res");
String date=(String)request.getParameter("date");
session.setAttribute("res", res);
session.setAttribute("date", date);
int id = (int)(Math.random() * 99999 + 1);
System.out.println(id);
try
{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:mysql://aak53meswtq4lo.ctkvrapz1owu.us-east-1.rds.amazonaws.com:3306/ebdb", "balugowtham", "mega789753");  
	 System.out.println("Connection Established");
	  
	PreparedStatement pstmt = con.prepareStatement("select * from request where username=?");
	pstmt.setString(1,username);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		%>
		<h3>Already Requested</h3>
		<a href="employee_login.html"></a>
	<% }
	else{
	   PreparedStatement ps = con.prepareStatement("insert into request values(?,?,?,'processing','processig','processing')");
		ps.setInt(1,id);
		ps.setString(2,username);
		ps.setString(3,res);
		int n = ps.executeUpdate();
		if(n>0){
			%><h3>Requested Entered</h3>
			<a href="home.html">home</a><%
		}
		else{
			%><h3>Request Not Entered</h3>
			<a hred="home.html"></a><%
		}
	}
	 
	 
	 
}
catch(Exception e)
{
	out.println(e);
}

%>

