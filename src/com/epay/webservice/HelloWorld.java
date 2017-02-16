package com.epay.webservice;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;

@WebService
public interface HelloWorld {
	@WebMethod
	@WebResult(name="result")
	public String say(@WebParam(name="str") String str);
}