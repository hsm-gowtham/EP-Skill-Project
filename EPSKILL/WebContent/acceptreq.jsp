
<%@ page import="java.sql.*" %>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("Driver Classes Loaded");  
	Connection con = null;
	con = DriverManager.getConnection("jdbc:mysql://aak53meswtq4lo.ctkvrapz1owu.us-east-1.rds.amazonaws.com:3306/ebdb", "balugowtham", "mega789753");  
	System.out.println("Connection Established");
	String uname=(String)session.getAttribute("uname");
	System.out.println(uname);
	PreparedStatement pstmt = con.prepareStatement("select username from request");
	ResultSet rs = pstmt.executeQuery();
	while(rs.next())
	{
		PreparedStatement pstmt1 = con.prepareStatement("update request set status_1='accept' where username=?");
		pstmt1.setString( 1, rs.getString(1));
		ResultSet rs1 = pstmt1.executeQuery();
		if(rs1.next())
		{
			System.out.println("updated");
			%> <jsp:forward page="Viewrequest_leader.jsp"></jsp:forward>  <%
		}
	}
}
catch(Exception e)
{
	out.println(e);
}
%>