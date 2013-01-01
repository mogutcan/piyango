<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-responsive.css" rel="stylesheet"> 
<link href="css/footer.css" rel="stylesheet">
<title>2013 Zenginini Arıyoruz</title>
</head>
<body background="img/blue.jpg">
<div id="wrap">
<center><img src="img/bilet.PNG"> </center>
<%
int biletNum = 0;
String hata;
String nullcheck = request.getParameter("biletID");
if(!nullcheck.isEmpty()){
	biletNum = Integer.parseInt(request.getParameter("biletID"));
}
if ((String.valueOf(biletNum).length() != 7) || (String.valueOf(biletNum).isEmpty()) ){
	hata = "Bilet numaranız 7 haneli olmalı ve boş girilmemelidir";%>
	<center><%= hata %></center>
<%}
else{
main.database.databaseOpen();
main.database.getData(biletNum);
main.database.databaseClose();
%>
<center>
<%= main.database.biletNo %> Numaralı biletinize ait sonuç <br>
<%= main.database.odul %> Türk Lirası 
</center>
<%} %>
</div>
<div id="footer">
    <div class="container" align="center">
        <p class="muted credit">&copy; 2012 <a href="http://www.google.com.tr/search?q=Mehmet+%C3%96%C4%9F%C3%BCtcan&aq=f&oq=Mehmet+%C3%96%C4%9F%C3%BCtcan&sugexp=chrome,mod=4&sourceid=chrome&ie=UTF-8">Mehmet Öğütcan</a> tarafından geliştirilmiştir.</p>
    </div>
</div>
</body>
</html>
