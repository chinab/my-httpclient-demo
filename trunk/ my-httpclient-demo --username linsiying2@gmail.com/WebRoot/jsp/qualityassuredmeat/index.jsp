<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.regex.*"%>
<%@ page import="org.apache.http.client.*"%>
<%@ page import="org.apache.http.client.HttpClient"%>
<%@ page import="org.apache.http.client.methods.*"%>
<%@ page import="org.apache.http.impl.client.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String __VIEWSTATE = "";
	String __EVENTVALIDATION = "";

	HttpClient httpclient = new DefaultHttpClient();
	try {
		HttpGet httpget = new HttpGet(
				"http://www.jmcct.gov.cn:8082/index.aspx");

		System.out.println("executing request " + httpget.getURI());

		// Create a response handler
		ResponseHandler<String> responseHandler = new BasicResponseHandler();
		String responseBody = httpclient.execute(httpget,
				responseHandler);
		System.out.println("----------------------------------------");
		System.out.println(responseBody);
		System.out.println("----------------------------------------");

		// get the parameter values : __VIEWSTATE __EVENTVALIDATION

		String regEx = "<input type=\"hidden\" name=\"__VIEWSTATE\" id=\"__VIEWSTATE\" value=\"(.*?)\" />";
		Matcher matcher = Pattern.compile(regEx).matcher(responseBody);
		if (matcher.find())

		{

			__VIEWSTATE = matcher.group(1);

		}
		regEx = "<input type=\"hidden\" name=\"__EVENTVALIDATION\" id=\"__EVENTVALIDATION\" value=\"(.*?)\" />";
		matcher = Pattern.compile(regEx).matcher(responseBody);
		if (matcher.find())

		{

			__EVENTVALIDATION = matcher.group(1);

		}

		System.out.println(__VIEWSTATE + "\t" + __EVENTVALIDATION);
		System.out.println("+++++++++++++++");
	} finally {
		// When HttpClient instance is no longer needed,
		// shut down the connection manager to ensure
		// immediate deallocation of all system resources
		httpclient.getConnectionManager().shutdown();
	}
%>

<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>动物溯源查询</title>
		<link href="dwsy/css/style.css" rel="stylesheet" type="text/css" />





	</head>

	<body>
		<div class="head">
			<img src="dwsy/images/head.gif" alt="images" />
		</div>
		<div class="fal-spie"></div>
		<div class="path">
			<a>证章查询</a>
		</div>
		<div class="empty"></div>
		<form action="<%=request.getContextPath() %>/jsp/qualityassuredmeat/chaxun.jsp"
			method="post">
			<table width="100%">
				<tr>
					<td align="right" class="text">
						证号：
						<input name="__txtHGZNo" type="text" class="fal-search2" value="3440700100012490" />
					</td>
					<td>

						<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
							value="<%=__VIEWSTATE%>" />
						<input type="hidden" name="__EVENTVALIDATION"
							id="__EVENTVALIDATION" value="<%=__EVENTVALIDATION%>" />

					</td>
				</tr>
			</table>
			<div class="empty"></div>
			<table width="100%">
				<tr>
					<td align="center">
						<input name="imageField" type="image" id="imageField"
							src="dwsy/images/botton.gif" />
					</td>
				</tr>
			</table>
			<div class="empty"></div>
		</form>
		<div>
			<p class="teen">
				<strong>温馨提示：</strong>在证号空格栏输入检疫证明 机打号码，您能查询所购买肉类的产地
				、检疫信息，正规肉类产品均可查询到 溯源信息。肉类产品的证号可从市场肉 档向档主索取。
		</div>
		<div class="empty"></div>
		<br />
		<br />
		<div align="center" class="go">
			<a href="http://wap.wxcsgd.com">返回无线城市</a>
		</div>
		<div class="empty"></div>
		<div class="chengjian" align="center">
			<p>
				江门市动物防疫监督所鼎识科技 版权所有
				<br />
				中国移动通信集团广东有限公司江门分公司 承建
			</p>
		</div>


	</body>
</html>
