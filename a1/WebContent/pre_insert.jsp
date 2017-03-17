<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>³É¹¦Ìí¼ÓÐÂÉÌÆ·ÐÅÏ¢</title>
</head>
<body>
<%@  include file="convert.jsp"%>
<%
   Connection conn=null;
   try
   {
	Class.forName("com.microsoft.sqlserver.jdbc.SqlServerDrive");
	String strConn="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=shopSystem";
	String strUser="sa";
	String strPassword="12345678";
	conn=DriverManager.getConnection(strConn,strUser,strPassword);
	String p_id=Byetes(request.getParmeter("p_id"));
	String p_type=Bytes(request.getParameter("p_type"));
	String p_name=Bytes(request.getParameter("p_name"));
	float p_price=Float.parseFloat(request.getParameter("p_price"));
	int p_quantity=Integer.parseInt(request.getParameter("P_quantity"));
	String p_image=Bytes(request.getParameter("p_image"));
	String p_description=Bytes(request.getParameter("p_description"));
	Date date=new Date();
	String p_time=String.valueOf(date.getMonth()+1)+"-"+date.getDate()+"-20"+String.valueOf(date.getYear()).substring(1);
    String strSql="insert into product values(?,?,?,?,?,?,?,?)";
    PreparedStatement pstmt=conn.prepareStatement(strSql);
    pstmt.setString(1,p_type);
    pstmt.setString(2,p_id);
    pstmt.setString(3,p_name);
    pstmt.setFloat(4,p_price);
    pstmt.setInt(5,p_quantity);
    pstmt.setString(7,p_description);
    pstmt.setString(8,p_time);
    int intTemp=pstmt.executeUpdate();
    if(intTemp!=0)
    {
    	out.println("<center><h3>"+"ÉÌÆ·Ìí¼Ó³É¹¦"+"</h3></center>");
    }
    else
    {
    	out.println("<center><h3>"+"ÉÌÆ·Ìí¼ÓÊ§°Ü"+"</h3></center>");
    }
    String strSql2="SELECT TOP 5 p_id,P_type,p_name,p_price,p_quantity FROM product WHERE p_type=? order by p_time asc";
    PreparedStatement pstmt2=conn.prepareStatement(strSql2);
    pstmt2.setString(1,"µçÊÓ»úÏµÁÐ");
    ResultSet rs =pstmt2.executeQuery();
%>

<table border="1" align="center">
<tr>
<th>ÉÌÆ·±àºÅ</th>
<th>ÉÌÆ·Àà±ð</th>
<th>ÉÌÆ·Ãû³Æ</th>
<th>ÉÌÆ·µ¥¼Û</th>
<th>ÉÌÆ·ÊýÁ¿</th>
</tr>
<%while(rs.next()){%>
<tr bgcolor="lightblue">
<th><%=rs.getString("p_id") %></th>
<th><%=rs.getString("p_type") %></th>
<th><%=rs.getString("p_name") %></th>
<th><%=rs.getFloat("p_price") %></th>
<th><%=rs.getInt("p_quantity") %></th>
</tr>
<%} %>
</table>
<%
  pstmt.close();
  pstmt2.close();
  conn.close();
   }
   catch(Exception e)
   {
	   out.println(e.toString());
   }
%>
</body>
</html>