<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.regex.*"%>
<%@ page import="org.apache.http.client.*"%>
<%@ page import="org.apache.http.*"%>
<%@ page import="org.apache.http.util.*"%>
<%@ page import="org.apache.http.client.HttpClient"%>
<%@ page import="org.apache.http.client.methods.*"%>
<%@ page import="org.apache.http.impl.client.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String url = request.getParameter("url");
	HttpClient httpClient = new DefaultHttpClient();

	String htmlResponse = "";
	try {
		HttpGet httpGet = new HttpGet("http://www.gdnyh.com" + url);

		HttpResponse httpResponse = httpClient.execute(httpGet);
		HttpEntity entity = httpResponse.getEntity();
		htmlResponse = EntityUtils.toString(entity);

		EntityUtils.consume(entity);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		// When HttpClient instance is no longer needed,
		// shut down the connection manager to ensure
		// immediate deallocation of all system resources
		httpClient.getConnectionManager().shutdown();
	}
	//System.out.println(htmlResponse);
	String regEx = "<TD class=\"STYLE55 xml_title24\" align=middle height=40>(.*?)</TD>";
	Matcher matcher = Pattern.compile(regEx, Pattern.DOTALL).matcher(
			htmlResponse);
	String title ="";
	
	if(matcher.find()){
		title = matcher.group(1);
	}
	
	regEx = "<SPAN class=NEWSREADME>(.*?)</SPAN>";
	 matcher = Pattern.compile(regEx, Pattern.DOTALL).matcher(
			htmlResponse);
	String subTitle ="";
	
	if(matcher.find()){
		subTitle = matcher.group(1);
	}
	
	regEx = "<!--epcontent-->(.*?)<!--/epcontent-->";
	 matcher = Pattern.compile(regEx, Pattern.DOTALL).matcher(
			htmlResponse);
	String epcontent ="";
	
	if(matcher.find()){
		epcontent = matcher.group(1);
	}
	
	
%>

<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>详情</title>

	</head>

	<body>
	<h2><%=title %></h2>
	<h6><%=subTitle %></h6>
		
<p><%=epcontent %></p>

	</body>
</html>
