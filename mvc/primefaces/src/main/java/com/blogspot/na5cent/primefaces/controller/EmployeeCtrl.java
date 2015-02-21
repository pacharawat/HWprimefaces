/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blogspot.na5cent.primefaces.controller;

import com.blogspot.na5cent.connectdb.model.EmployeeMap;
import com.blogspot.na5cent.service.EmployeeSearchService;
import com.blogspot.na5cent.service.SearchServiceUtils;
import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

/**
 *
 * @author anonymous
 */
@ManagedBean
@ViewScoped
public class EmployeeCtrl implements Serializable{

    private List<EmployeeMap> employees;
    private String query;
    private String searchBy;
    
    @PostConstruct
    public void postConstruct(){
        onSearch();
    }

    public void onSearch() {
        EmployeeSearchService service = SearchServiceUtils.findServiceByName(searchBy);
        employees = service.search(query);
    }
    
    public void onClear(){
        query = null;
        searchBy = null;
        onSearch();
    }

    public List<EmployeeMap> getEmployees() {
        if (employees == null) {
            employees = new LinkedList<>();
        }

        return employees;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public String getSearchBy() {
        return searchBy;
    }

    public void setSearchBy(String searchBy) {
        this.searchBy = searchBy;
    }

}
