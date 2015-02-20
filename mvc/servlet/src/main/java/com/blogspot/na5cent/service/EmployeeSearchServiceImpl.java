/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blogspot.na5cent.service;

import com.blogspot.na5cent.connectdb.annotation.Service;
import com.blogspot.na5cent.connectdb.model.EmployeeMap;
import com.blogspot.na5cent.connectdb.query.QueryBuilder3;
import java.util.List;

/**
 *
 * @author anonymous
 */
public class EmployeeSearchServiceImpl implements EmployeeSearchService {

    @Override
    public List<EmployeeMap> search(String keyword) {
        return QueryBuilder3.fromSQL("SELECT * FROM Employees")
                .executeforList(EmployeeMap.class);
    }

}
