/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.energymeter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.jcr.Node;
import javax.jcr.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jose
 */
@WebServlet(urlPatterns = {"/generalservlet"})
@MultipartConfig
public class GetDataFromArduino extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date x = new Date();
        System.out.println("Connnection accepted " + x.getMinutes());
        System.out.println("isAsync" + request.isAsyncStarted());
        System.out.println("parameter: " + request.getParameter("power"));
        request.logout();
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }
    
}
