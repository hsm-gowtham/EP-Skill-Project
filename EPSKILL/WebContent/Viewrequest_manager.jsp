<%@ page import="java.sql.*" %>
<html>
    <head>
        <title>Simple JSP Application</title>
    </head>
    <body bgcolor="white">
    <h2 align="center">Manager Home</h2>
    <B><a href="logout.jsp">Logout</a></B>
<table align=center width="800">
 <tr align=center bgcolor="pink" border=1>
<th>ID</th>
<th>USERNAME</th>
<th>REASON</th> 
<th>Leader Status</th> 
<th>Manager Status</th> 
<th>Final Status</th> 
</tr>
<%

Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");  
Connection con = null;
con = DriverManager.getConnection("jdbc:mysql://aak53meswtq4lo.ctkvrapz1owu.us-east-1.rds.amazonaws.com:3306/ebdb", "balugowtham", "mega789753");  
System.out.println("Connection Established");
 
 PreparedStatement pstmt = con.prepareStatement("select * from request");
ResultSet rs = pstmt.executeQuery();
 while(rs.next())
{
	%>
	<tr align=center>
	<td><%=rs.getString("id")%></td>
	<td><%=rs.getString("username")%></td>
	<td><%=rs.getString("request")%></td>
	<td><%=rs.getString("status_1")%></td>
	<td><%=rs.getString("status_2")%></td>
	<td><%=rs.getString("status_3")%></td>
	</tr>
	<%
}

%>




</table>
</table>
<form method="post" action="checkmanager_res.jsp">
<table align="center">
<tr>
<td>Enter ID</td>
<td><input type="text" name="id"></td>
</tr>
<tr>
<td>Enter Username</td>
<td><input type="text" name="uname"></td>
</tr>
<tr>
<td><a href="acceptreq.jsp"><input type="submit" name="button" value="Accept"></a></td>
<td><a href="rejectreq.jsp"><input type="submit" name="button" value="Reject"></a></td>
</tr>
</table>
</form>


    </body>
</html>



