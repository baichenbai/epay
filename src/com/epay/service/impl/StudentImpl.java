package com.epay.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epay.bean.Student;
import com.epay.dao.StudentMapper;
import com.epay.service.IStudent;

@Service
public class StudentImpl implements IStudent {
	@Autowired
	private StudentMapper sm;
	@Override
	public Student read() {
		Student ss = sm.selectByPrimaryKey("111");
		return ss;
	}

}
