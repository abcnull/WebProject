package com.example.crud.service;

import com.example.crud.bean.Customer;
import com.example.crud.dao.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 石磊 on 2018/8/13.
 */
@Service
public class CustomerService {
    @Autowired
    CustomerMapper customerMapper;
    //通过firstName查找对象，返回对象customer
    public Customer loginByName(String firstName){
        return customerMapper.selectByFirstName(firstName);
    }
}
