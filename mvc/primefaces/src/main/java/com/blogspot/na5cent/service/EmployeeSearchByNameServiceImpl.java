/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blogspot.na5cent.service;

import com.blogspot.na5cent.connectdb.query.QueryBuilder3;
import com.blogspot.na5cent.connectdb.util.SqlUtils;
import com.blogspot.na5cent.primefaces.model.Employee;
import java.util.List;

/**
 *
 * @author anonymous
 */
public class EmployeeSearchByNameServiceImpl implements EmployeeSearchService {

    @Override
    public List<Employee> search(String keyword) {
        keyword = SqlUtils.wrapKeywordLike(keyword);
        
        return QueryBuilder3.fromSQL("SELECT * FROM Employees WHERE LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ?")
                .addParam(keyword)
                .addParam(keyword)
                .executeforList(Employee.class);
    }

}
