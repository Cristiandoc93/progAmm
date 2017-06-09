package amm.nerdbook;

import amm.nerdbook.Classi.UtentiReg;
import amm.nerdbook.Classi.UtentiRegFactory;
import amm.nerdbook.Classi.Post;
import amm.nerdbook.Classi.PostFactory;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Bacheca extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    
    
        
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
      
         
         
         
         
        //caso utente loggato
         if(session.getAttribute("bacError") != "true"){
        
         if(session!=null && 
           session.getAttribute("loggedOn")!=null &&
           session.getAttribute("loggedOn").equals(true)){
          
            String user = request.getParameter("user");
            
            int userID = (int)session.getAttribute("id");
            
            
            
            
            if(user != null){
                userID = Integer.parseInt(user);
            } else {
                
                Integer id = (Integer)session.getAttribute("id");
                userID = id;
                
                }
           

          
         UtentiReg utente = UtentiRegFactory.getInstance().getUtenteById(userID);
         
         
        
      
        if(utente != null && session.getAttribute("bacError") != "true") {
            request.setAttribute("utente", utente);
            
            String content = request.getParameter("newpost");
            String url = request.getParameter("urlP");
            
            ArrayList<UtentiReg> utenti = UtentiRegFactory.getInstance().getUtentiList();
            request.setAttribute("utenti", utenti);
        
            
            List<Post> posts = PostFactory.getInstance().getPostList(utente);
            request.setAttribute("posts", posts);       
            
            
            
         
           
             
            //caso nuovo post
                if(request.getParameter("inviapost") != null){
                request.setAttribute("content", content);
                request.setAttribute("url", url);
                session.setAttribute("wrPost", request.getParameter("newpost"));
                session.setAttribute("urlPost", request.getParameter("urlP"));
                request.setAttribute("invioPost", "okk");
                request.getRequestDispatcher("bacheca.jsp").forward(request, response);}
            
          
          
            //caso conferma nuovo post
                if(request.getParameter("sendpost") != null){
                    Post post = new Post();
                    post.setContent(content + "<br>"
                          + url);
                    
                    post.setUser(UtentiRegFactory.getInstance().getUtenteById(userID));
                    post.setAutore(UtentiRegFactory.getInstance().getUtenteById((int)session.getAttribute("id")));
                    PostFactory.getInstance().addNewPost(post);
                    
                request.setAttribute("sendPostok", "okk");
                request.getRequestDispatcher("bacheca.jsp").forward(request, response);}

                
            session.setAttribute("loggedOn", true);            
            request.getRequestDispatcher("bacheca.jsp").forward(request, response);
            
            
    
            }
       
            
        request.getRequestDispatcher("bacheca.jsp").forward(request, response);
         
        
        }}
        // caso utente non loggato//
         if(request.getAttribute("bacError")!=null){
            request.getRequestDispatcher("profiloPage.jsp").forward(request, response);
        }
        else {
            
            request.getRequestDispatcher("bacheca.jsp").forward(request, response);
        }
        
        
        
         
            
      
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}