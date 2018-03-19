package br.unisal.controllers;
 
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet(name="FileUploadServlet", urlPatterns={"/upload"})     // specify urlPattern for servlet
@MultipartConfig(fileSizeThreshold = 1024*1024*2,maxFileSize = 1024*1024*10,maxRequestSize = 1024*1024*50)
public class FileUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
     
    @Override
    public void init()throws ServletException{
        System.out.println("servlet initialized");
    }
     
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathToUpload = getServletContext().getRealPath("/WEB-INF/upload");
        
        //String path = getServletContext().getRealPath("/WEB-INF/upload");
        //System.out.println(path);
        
        //creating the save directory if it doesn't exist
        File uploadDirectory = new File(pathToUpload);
        if(!uploadDirectory.exists()){
            uploadDirectory.mkdirs();
        }
         
        //Iterating the parts received from 'multipart/form-data' request
        for(Part part : request.getParts()){
            //extracting the file name
            String fileName = null;
            String contentDisposition = part.getHeader("content-disposition");
            String[] strgs = contentDisposition.split(";");
            for(String strng : strgs) {
                if(strng.trim().startsWith("filename")){
                    fileName = strng.substring(strng.indexOf("=")+2, strng.length()-1);
                }
            }
            System.out.println(fileName);
            pathToUpload = pathToUpload+File.separator+fileName;
            part.write(pathToUpload);
            request.setAttribute("message", pathToUpload);
            getServletContext().getRequestDispatcher("/listaFilmes").forward(request, response);
        }
    }
 
}