/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.energymeter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jcr.Node;
import javax.jcr.NodeIterator;
import javax.jcr.Repository;
import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.jcr.SimpleCredentials;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.jackrabbit.commons.JcrUtils;

/**
 *
 * @author Jose
 */
@WebServlet(urlPatterns = {"/generalservlet"})
@MultipartConfig
public class GetDataFromArduino extends HttpServlet{
    
    private static String nameOfParameterKey = "";
    private static String nameOfProject = "energyMeter";
    private static String defaultApp = "";
    private static String defaultPropertyKey = "energy";
    private String macAddress = "";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(request.getParameterMap().containsKey(nameOfParameterKey)){
            Session jcrSession = repoLogin();
            try {
                Node rootNode = jcrSession.getRootNode();
                if(rootNode.hasNode(nameOfProject)){
                    Node projectNode = rootNode.getNode(nameOfProject);
                    NodeIterator values = projectNode.getNodes();
                    while(values.hasNext()){
                        Node valueTemp = values.nextNode();
                        if(valueTemp.hasNode(macAddress)){
                            if(valueTemp.hasProperty(defaultApp)){
                                String currentApp = valueTemp.getProperty(defaultApp).toString();
                                if(valueTemp.hasNode(currentApp)){
                                    Node currentAppNode = valueTemp.getNode(currentApp);
                                    Date current = new Date();
                                    String year = current.getYear() + "";
                                    String month = current.getMonth() + "";
                                    String day = current.getDay() + "";
                                    String hour = current.getHours() + "";
                                    String minute = current.getMinutes() + "";
                                    String seconds = current.getSeconds() + "";
                                    String meditionValue = request.getParameter(nameOfParameterKey);
                                    Node yearNode;
                                    Node monthNode;
                                    Node dayNode;
                                    Node hourNode;
                                    Node minuteNode;
                                    Node secondNode;
                                    if(currentAppNode.hasNode(year)){
                                        yearNode = currentAppNode.getNode(year);
                                    } else {
                                        yearNode = currentAppNode.addNode(year);
                                    }
                                    if(yearNode.hasNode(month)){
                                        monthNode = yearNode.getNode(month);
                                    } else {
                                        monthNode = yearNode.addNode(month);
                                    }
                                    if(monthNode.hasNode(day)){
                                        dayNode = monthNode.getNode(day);
                                    } else {
                                        dayNode = monthNode.addNode(day);
                                    }
                                    if(dayNode.hasNode(hour)){
                                        hourNode = dayNode.getNode(hour);
                                    } else {
                                        hourNode = dayNode.addNode(hour);
                                    }
                                    if(hourNode.hasNode(minute)){
                                        minuteNode = hourNode.getNode(minute);
                                    } else {
                                        minuteNode = hourNode.addNode(minute);
                                    }
                                    if(minuteNode.hasNode(seconds)){
                                        secondNode = minuteNode.getNode(seconds);
                                    } else {
                                        secondNode = minuteNode.addNode(seconds);
                                    }
                                    secondNode.setProperty(defaultPropertyKey,request.getParameter(nameOfParameterKey));
                                } 
                            }
                        }
                    }
                }
            } catch (RepositoryException ex) {
                Logger.getLogger(GetDataFromArduino.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }
    
    protected Session repoLogin(){
        try{
            System.out.println("Connecting to repository...");
            String url = "http://intern5.xumak.gt:8080/rmi";
            Repository repository = JcrUtils.getRepository(url);
            /**
            * Enter to jackrabbit using the credentials admin:admin,password:admin
            */
            SimpleCredentials creds = new SimpleCredentials("admin","admin".toCharArray());
            Session jcrSession = repository.login(creds, "default");
            return jcrSession;
        }catch(RepositoryException RE){
            System.err.println("Error with start Session of JackRabbit");
            return null;
        }
    }
    
    protected void repoLogout(Session jcrSession){
        if(jcrSession != null){
            jcrSession.logout();
        } else {
            System.err.println("Session can't be closed");
        }
    }
    
}
