<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.Date"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成功添加新商品信息</title>
</head>
<body>
<%@ include file="convert.jsp" %>
<%
   Connection conn=null;
   try
   {
	Class.forName("com.microsoft.sqlserver.jdbc.SqlServerDrive");
	String strConn="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=shopSystem";
	String strUser="sa";
	String strPassword="12345678";
	conn=DriverManager.getConnection(strConn,strUser,strPassword);
	Statement stmt=conn.createStatement();
	String p_id=Byetes(request.getParmeter("p_id"));
	String p_type=Bytes(request.getParameter("p_type"));
	String p_name=Bytes(request.getParameter("p_name"));
	float p_price=Float.parseFloat(request.getParameter("p_price"));
	int p_quantity=Integer.parseInt(request.getParameter("P_quantity"));
	String p_image=Bytes(request.getParameter("p_image"));
	String p_description=Bytes(request.getParameter("p_description"));
	Date date=new Date();
	String p_time=String.valueOf(date.getMonth()+1)+"-"+date.getDate()+"-20"+String.valueOf(date.getYear()).substring(1);
    String strSql="insert into product values('"+p_type+"','"+p_id+"','"+p_name+"','"+p_price+"','"+p_quantity+"','"+p_image+"','"+p_description+"','"+p_time+"')";
    
    int intTemp=stmt.executeUpdate(strSql);
    if(intTemp!=0)
    {
    	out.println("<font sizr=4pt color='red'>"+"商品添加成功！"+"</font>");
    }
    else
    {
    	out.println("<font size=4pt color='red'>"+"商品添加失败!"+"</font>");
    }
    }
   catch(Exception e)
   {
	   out.println(e.toString());
   }

%>
</body>
</html>