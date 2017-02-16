<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/*
	开发步骤：
	1、创建xmlHttpRquest对象
	2、open('POST', url, true)链接
	3、设置请求头
	4、send(xml)
	5、回调函数，接受响应xml
	6、从返回xml中抓取相关字段的信息
	*/
	var xmlHttpRequest;
	if (window.ActiveXObject){
		xmlHttpRequest = new ActiveXObject("Microsoft.XMLHttp");//创建XMLHTTP对象,IE11不支持
	}
	else if(window.XMLHttpRequest){
		xmlHttpRequest = new XMLHttpRequest();
	}
	
	//发送消息
	function sendMsg(){
		var username = "zhangyg";//用户输入的条件
		var url = "http://localhost:8080/epay/webservice/HelloWorld";//webService访问链接
		var data="<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:q0="http://webservice.epay.com/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			  <soapenv:Body>
	    <q0:say/>
	  </soapenv:Body>
	</soapenv:Envelope>";
		xmlHttpRequest.open("POST", url, true);//打开链接
		xmlHttpRequest.setRequestHeader("Content-Type","text/xml;charset=utf-8");	//设置请求头
		xmlHttpRequest.send(data);//发起soap请求
		xmlHttpRequest.onreadystatechange = _back;//在onreadystatechange事件绑定回调函数
	}
	
	//回调函数
	function _back(){
		//alert("sss");
		if(xmlHttpRequest.readyState == 4){//提交完成
			if(xmlHttpRequest.status == 200){//调用成功
				//var parser = new DOMParser();
				var retXml = xmlHttpRequest.responseXML;
			    //var retXml = parser.parseFromString(xmlHttpRequest.responseText, 'text/xml');
				var ret = retXml.getElementsByTagName("return")[0];
				if(ret != null){
					var customerContract = ret.getElementsByTagName("customerContract")[0].firstChild.nodeValue;
					alert(customerContract);
					document.getElementById("customerContract").innerHTML = customerContract;
                                }
				else{
					alert("没有查询到数据");
				}
			}
			else{
				// 无法正确访问出口报运服务!
			}
		}
	}
</script>
</head>
<body>
	<button onclick="sendMsg()" >访问接口</button>
</body>
</html>