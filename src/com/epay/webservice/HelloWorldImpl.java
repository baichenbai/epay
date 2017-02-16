package com.epay.webservice;

import com.epay.webservice.HelloWorld;
import javax.jws.WebService;
@WebService/*(endpointInterface="com.epay.webservice.HelloWorld",serviceName="helloWorld",targetNamespace="http://dao.cxf.ws.com/")*/
public class HelloWorldImpl implements HelloWorld {
	public String say(String str) {
		System.out.println("sayHello() is called");
		return "Hello"+str;
	}
}