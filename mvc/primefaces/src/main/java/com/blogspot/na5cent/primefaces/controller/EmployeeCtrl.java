/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blogspot.na5cent.primefaces.controller;

import com.blogspot.na5cent.primefaces.model.Employee;
import com.blogspot.na5cent.service.EmployeeSearchService;
import com.blogspot.na5cent.service.SearchServiceUtils;
import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author anonymous
 */
@ManagedBean
@ViewScoped
public class EmployeeCtrl implements Serializable {

    private List<Employee> employees;
    private String query;
    private String searchBy;
    //
    private Employee employee;

    @PostConstruct
    public void postConstruct() {
        onSearch();
    }

    public void onSearch() {
        EmployeeSearchService service = SearchServiceUtils.findServiceByName(searchBy);
        employees = service.search(query);
    }

    public void onClear() {
        query = null;
        searchBy = null;
        onSearch();
    }

    public void onDelete() {
        System.out.println("delelte id = " + employee.getId());
        notifyMessage();
    }

    public void notifyMessage() {
        FacesContext.getCurrentInstance()
                .addMessage(null, new FacesMessage(
                                FacesMessage.SEVERITY_INFO,
                                "Delete Employee",
                                "success (id " + employee.getId() + ")"
                        ));

    }

    public List<Employee> getEmployees() {
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

    private Object request(String param) {
        return FacesContext.getCurrentInstance()
                .getExternalContext()
                .getRequestParameterMap()
                .get(param);
    }

    public void onSelect() {
        Integer id = Integer.valueOf((String) request("employeeId"));
        Employee emp = new Employee();
        emp.setId(id);
        int index = getEmployees().indexOf(emp);
        employee = getEmployees().get(index);
    }

    public Employee getEmployee() {
        if (employee == null) {
            employee = new Employee();
        }

        return employee;
    }

}
