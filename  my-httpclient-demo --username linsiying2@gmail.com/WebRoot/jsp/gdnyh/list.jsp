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

	HttpClient httpClient = new DefaultHttpClient();

	String htmlResponse = "";
	try {
		HttpGet httpGet = new HttpGet(
				"http://www.gdnyh.com/web/sort.aspx?sort_id=406");

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
	String regEx = "<A href='(.*?)' target=_blank>(.*?)</A> <span class='gray'>(.*?)</span>";
	Matcher matcher = Pattern.compile(regEx, Pattern.DOTALL).matcher(
			htmlResponse);
%>

<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>列表</title>

	</head>

	<body>
		<%
			while (matcher.find()) {
		%>
		<a href="<%=request.getContextPath()+"/jsp/gdnyh/view.jsp?url="+matcher.group(1)%>" >
		<%=matcher.group(2).trim()%></a>(<%=matcher.group(3)%>)<br />
		<br />


		<%
			}
		%>


	</body>
</html>
