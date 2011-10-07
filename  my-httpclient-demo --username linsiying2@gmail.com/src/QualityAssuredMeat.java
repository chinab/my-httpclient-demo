import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;

/**
 * QualityAssuredMeat.java	Oct 5, 2011 12:41:24 AM
 * Copyright 2011 Guangzhou Dao Yi Information Technology Co.,Ltd. All rights reserved.
 */

/**
 * @author linsiying
 * @class  QualityAssuredMeat
 * @Description: TODO
 * @version V1.0
 */
public class QualityAssuredMeat {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {

		HttpClient httpclient = new DefaultHttpClient();
		try {
			HttpGet httpget = new HttpGet(
					"http://www.jmcct.gov.cn:8082/index.aspx");

			System.out.println("executing request " + httpget.getURI());

			// Create a response handler
			ResponseHandler<String> responseHandler = new BasicResponseHandler();
			String responseBody = httpclient.execute(httpget, responseHandler);
			System.out.println("----------------------------------------");
			System.out.println(responseBody);
			System.out.println("----------------------------------------");

			// get the parameter values : __VIEWSTATE __EVENTVALIDATION
			String __VIEWSTATE = "";
			String __EVENTVALIDATION = "";
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

			HttpPost httpost = new HttpPost(
					"http://www.jmcct.gov.cn:8082/index.aspx");

			List<NameValuePair> nvps = new ArrayList<NameValuePair>();
			nvps.add(new BasicNameValuePair("__VIEWSTATE", __VIEWSTATE));
			nvps.add(new BasicNameValuePair("__EVENTVALIDATION",
					__EVENTVALIDATION));
			nvps.add(new BasicNameValuePair("txtHGZNo", "3440700100012490"));
			nvps.add(new BasicNameValuePair("ImgSearch", "²é Ñ¯"));
			nvps.add(new BasicNameValuePair("hdUser", ""));

			httpost.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));

			responseHandler = new BasicResponseHandler();
			responseBody = httpclient.execute(httpost, responseHandler);
			
			System.out.println("----------------------------------------");
			System.out.println(responseBody);
			System.out.println("----------------------------------------");

		} finally {
			// When HttpClient instance is no longer needed,
			// shut down the connection manager to ensure
			// immediate deallocation of all system resources
			httpclient.getConnectionManager().shutdown();
		}
	}

}
