/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blogspot.na5cent.primefaces.controller;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

/**
 *
 * @author anonymous
 */
@ManagedBean
@ViewScoped
public class UpdateElementCtrl implements Serializable {

    public long getTimeStamp() {
        return new Date().getTime();
    }
    
    public String getUUID(){
        return UUID.randomUUID().toString();
    }
}
