<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
   public String Bytes(String str)
   {
	try
	{
		String strOld=str;
		byte[] strNew=strOld.getBytes("ISO8859-1");
		String bytes=new String(strNew);
		return bytes;
	}
	catch(Exception e){}
	return null;
   }


%>

</body>
</html>