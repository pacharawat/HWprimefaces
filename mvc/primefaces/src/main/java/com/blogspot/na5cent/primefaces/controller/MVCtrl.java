/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blogspot.na5cent.primefaces.controller;

import com.blogspot.na5cent.primefaces.model.User;
import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

/**
 *
 * @author anonymous
 */
@ManagedBean
@ViewScoped
public class MVCtrl implements Serializable {

    private User user;
    private List<User> users;

    public void onAddUser() {
        if (getUser().getName() != null) {
            getUsers().add(getUser());
            user = null;
        }
    }

    public User getUser() {
        if (user == null) {
            user = new User();
        }

        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<User> getUsers() {
        if (users == null) {
            users = new LinkedList<>();
        }

        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

}
