<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品信息</title>
</head>
<body>
<center>
<h2>添加新商品信息</h2>
<from action="do_insert.jps" method="post">
商品编号：<input type="text" name="p_id"/><br>
商品类别：<input type="text" name="p_type"/><br>
商品名称：<input type="text" name="p_name"/><br>
商品价格：<input type="text" name="p_price"/><br>
商品数量：<input type="text" name="p_quantity"/><br>
图片路径：<input type="text" name="p_image"/><br>
商品描述：<input type="text" name="p_description"/><br>
<input type="submit" value="添加"/>
<input type="reset" name="重置"/>
</from>
</center>
</body>
</html>