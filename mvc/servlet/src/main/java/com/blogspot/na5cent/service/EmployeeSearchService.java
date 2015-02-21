/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blogspot.na5cent.service;

import com.blogspot.na5cent.model.Employee;
import java.util.List;

/**
 *
 * @author anonymous
 */
public interface EmployeeSearchService {

    List<Employee> search(String keyword);
}
