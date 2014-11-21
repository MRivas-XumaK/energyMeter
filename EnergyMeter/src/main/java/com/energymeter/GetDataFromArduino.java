/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.energymeter;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.math.BigDecimal;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jcr.InvalidItemStateException;
import javax.jcr.ItemExistsException;
import javax.jcr.Node;
import javax.jcr.NodeIterator;
import javax.jcr.PathNotFoundException;
import javax.jcr.ReferentialIntegrityException;
import javax.jcr.Repository;
import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.jcr.SimpleCredentials;
import javax.jcr.lock.LockException;
import javax.jcr.nodetype.ConstraintViolationException;
import javax.jcr.nodetype.NoSuchNodeTypeException;
import javax.jcr.version.VersionException;
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
    
    private static String nameOfParameterKey = "power";
    private static String keyToCreateNewUser = "newuser";
    private static String keyToSavePass = "pss";
    private static String keyLoadSession = "";
    private static String keyLiveData = "";
    private static String nameOfProject = "energyMeter";
    private static String defaultApp = "currentApp";
    private static String defaultPropertyKey = "energy";
    private String macAddress = "";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(request.getParameterMap().containsKey(nameOfParameterKey)){
            String powerParameter = request.getParameter(nameOfParameterKey);
            String macAddress = request.getParameter("macaddress");
            //this.cleanNodes();
            
            Node responseVar = null;
            Session jcrSession = this.repoLogin();
            try {
                Node rootNode = jcrSession.getRootNode();
                if(rootNode.hasNode(nameOfProject)){
                    Node projectName = rootNode.getNode(nameOfProject);
                    NodeIterator userIterator = projectName.getNodes();
                    while(userIterator.hasNext()){
                        Node userTemp = userIterator.nextNode();
                        if(userTemp.hasNode(macAddress)){
                            responseVar = userTemp.getNode(macAddress);
                        }
                    }
                }
                
                System.out.println(responseVar);
                if(null != responseVar){
                    Date dateToSet = new Date();
                    String year = dateToSet.getYear() + "";
                    String month = dateToSet.getMonth() + "";
                    String day = dateToSet.getDay() + "";
                    String hour = dateToSet.getHours() + "";
                    String minute = dateToSet.getMinutes() + "";
                    String second = dateToSet.getSeconds() + "";
                    
                    Node yearTemp = null;
                    Node monthTemp = null;
                    Node dayTemp = null;
                    Node hourTemp = null;
                    Node minuteTemp = null;
                    Node secondTemp = null;
                    
                    /*codigo para guardar datos*/
                    if(responseVar.hasNode(year)){
                        yearTemp = responseVar.getNode(year);  
                    } else {
                        yearTemp = responseVar.addNode(year);
                    }
                    if(yearTemp.hasNode(month)){
                        monthTemp = yearTemp.getNode(month); 
                    } else {
                        monthTemp = yearTemp.addNode(month);
                    }
                    if(monthTemp.hasNode(day)){
                        dayTemp = monthTemp.getNode(day);  
                    } else {
                        dayTemp = monthTemp.addNode(day);
                    }
                    if(dayTemp.hasNode(hour)){
                        hourTemp = dayTemp.getNode(hour); 
                    } else {
                        hourTemp = dayTemp.addNode(hour);
                    }
                    if(hourTemp.hasNode(minute)){
                        minuteTemp = hourTemp.getNode(minute);  
                    } else {
                        minuteTemp = hourTemp.addNode(minute);
                    }
                    if(minuteTemp.hasNode(second)){
                        secondTemp = minuteTemp.getNode(second); 
                    } else {
                        secondTemp = minuteTemp.addNode(second);
                    }
                    secondTemp.setProperty(defaultPropertyKey, powerParameter);
                    jcrSession.save();
                    /*Aqui termina codigo para guardar datos*/ 
                }
            } catch (RepositoryException ex) {
                Logger.getLogger(GetDataFromArduino.class.getName()).log(Level.SEVERE, null, ex);
            } finally{
                this.repoLogout(jcrSession);
            }
            
            
        }
        if(request.getParameterMap().containsKey(keyToCreateNewUser)){
            String user = request.getParameter(keyToCreateNewUser);
            String pass = request.getParameter(keyToSavePass);
            String macAddressTemp = request.getParameter("macaddress");
            Session jcrSession = this.repoLogin();
            try {
                Node rootNode = jcrSession.getRootNode();
                Node projectName = null;
                if(rootNode.hasNode(nameOfProject)){
                    projectName = rootNode.getNode(nameOfProject);
                } else {
                    projectName = rootNode.addNode(nameOfProject);
                }
                if(projectName.hasNode(user)){
                    Writer writer = response.getWriter();
                    writer.write("error");
                } else {
                    Node userTemp = projectName.addNode(user);
                    userTemp.setProperty(keyToSavePass,pass);
                    userTemp.addNode(macAddressTemp);
                    jcrSession.save();
                }
            } catch (RepositoryException ex) {
                Logger.getLogger(GetDataFromArduino.class.getName()).log(Level.SEVERE, null, ex);
            } finally{
                this.repoLogout(jcrSession);
            }
        }
        if(request.getParameterMap().containsKey(keyLiveData)){
            
        }
        if(request.getParameterMap().containsKey(keyLoadSession)){
            
        }
        
        
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }
    
   /* protected void cleanNodes(){
        Session jcrSession = this.repoLogin();
        Node rootNode;
        try {
            rootNode = jcrSession.getRootNode();
            NodeIterator cleanNodes = rootNode.getNodes();
            while(cleanNodes.hasNext()){
                Node temp = cleanNodes.nextNode();
                System.out.println(temp.getName());

                if(!(temp.getName().contains(":"))){
                    rootNode.getNode(temp.getName()).remove();
                    jcrSession.save();
                }
            }
        } catch (RepositoryException ex) {
            Logger.getLogger(GetDataFromArduino.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            this.repoLogout(jcrSession);
        }
    }
    
    protected Node searchByMacAddress(String macAddress){
        Node response = null;
        Session jcrSession = this.repoLogin();
        try {
            Node rootNode = jcrSession.getRootNode();
            NodeIterator userIterator = rootNode.getNodes();
            while(userIterator.hasNext()){
                Node userTemp = userIterator.nextNode();
                if(userTemp.hasNode(macAddress)){
                    response = userTemp.getNode(macAddress);
                }
            }
        } catch (RepositoryException ex) {
            Logger.getLogger(GetDataFromArduino.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            this.repoLogout(jcrSession);
            return response;
        }
        
        
    }*/
    
    protected Session repoLogin(){
        try{
            System.out.println("Connecting to repository...");
            String url = "http://localhost:8080/rmi";
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
