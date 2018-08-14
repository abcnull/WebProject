package com.example.crud.dao;

import com.example.crud.bean.Customer;

/**
 * Created by 石磊 on 2018/8/13.
 */
public interface CustomerMapper {
    Customer selectByFirstName(String firstName);
}
