
<%@ page import="java.sql.*" %>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("Driver Classes Loaded");  
	Connection con = null;
	con = DriverManager.getConnection("jdbc:mysql://aak53meswtq4lo.ctkvrapz1owu.us-east-1.rds.amazonaws.com:3306/ebdb", "balugowtham", "mega789753");  
	System.out.println("Connection Established");
	int id = Integer.parseInt(request.getParameter("id"));
	String  uname = request.getParameter("uname");
	String button = request.getParameter("button");
	PreparedStatement pstmt = con.prepareStatement("update request set status_1=? where username=? and id=?");
	pstmt.setString(1,button);
	pstmt.setString(2,uname);
	pstmt.setInt(3,id);
	int n = pstmt.executeUpdate();
	if(n>0){
		%><h4>Updated
		<a href="Viewrequest_manager.jsp">Home</a></h4><%
	}
	else{
		%><h4>Not Updated or Invalid Credentials</h4><%
	}
}
catch(Exception e)
{
	out.println(e);
}
%>