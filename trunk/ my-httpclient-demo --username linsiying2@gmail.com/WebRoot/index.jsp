<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>动物溯源查询</title>
		<link href="dwsy/css/style.css" rel="stylesheet" type="text/css" />

		<base href="<%=basePath%>">



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
		<form action="chaxun.mobo?cmd=request&amp;isWap=1&amp;__isSearch=1"
			method="post">
			<table width="100%">
				<tr>
					<td align="right" class="text">
						证号：
					</td>
					<td>
						<input name="__txtHGZNo" type="text" class="fal-search2" value="" />
						<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="" />
						<input type="hidden" name="__EVENTVALIDATION"
							id="__EVENTVALIDATION" value="" />
						<input type="hidden" name="__ImgSearch" id="__ImgSearch"
							value="查 询" />
						<input name="hdType" type="hidden" id="hdType" />
						<input name="hdUser" type="hidden" id="hdUser" />
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
		</div>
		
	</body>
</html>
