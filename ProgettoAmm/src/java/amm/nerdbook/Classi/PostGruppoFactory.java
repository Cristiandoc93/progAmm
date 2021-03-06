/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package amm.nerdbook.Classi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Cristian
 */
public class PostGruppoFactory {
    
    
     
    private static PostGruppoFactory singleton;
    
    public static PostGruppoFactory getInstance() {
        if (singleton == null) {
            singleton = new PostGruppoFactory();
        }
        return singleton;
    }
    
    private String connectionString;
    
    public void setConnectionString(String s){
	this.connectionString = s;
    }
    public String getConnectionString(){
            return this.connectionString;
    }
    
    
     public List getPostGList(Gruppi grp) {
        GruppiRegFactory gruppopost = GruppiRegFactory.getInstance();
        List<PostGruppo> listaPostG = new ArrayList<PostGruppo>();
        UtentiRegFactory utentireg = UtentiRegFactory.getInstance();

        try {
         
            Connection conn = DriverManager.getConnection(connectionString, "cri", "123");
            
            String query = 
                      "select * from post_gruppo "
                      + "where gruppo_id = ?";
            
       
            PreparedStatement stmt = conn.prepareStatement(query);
            
        
            stmt.setInt(1, grp.getGruppo_id());
            
 
            ResultSet res = stmt.executeQuery();

       
            while (res.next()) {
                
                PostGruppo current = new PostGruppo();
        
                current.setPost_id(res.getInt("post_id"));
             
                current.setContent(res.getString("content"));
     
                current.setGruppo_id(gruppopost.getGruppoById(res.getInt("gruppo_id")));
                UtentiReg apg = utentireg.getUtenteById(res.getInt("autore_post_gruppo"));
           
                current.setAutore_post_gruppo(apg);
                
                listaPostG.add(current);
            }

            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaPostG;
    }
     
     
      public void cancellaPostGruppo(int gruppo){
         try{
         Connection conn = DriverManager.getConnection(connectionString, "cri", "123");
            
            String query = 
                      "delete from post_gruppo "
                    + "where gruppo_id = ?";
            
            // Prepared Statement
            PreparedStatement stmt = conn.prepareStatement(query);
            
            
            stmt.setInt(1, gruppo);
            stmt.executeUpdate();
            
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
      
      
       public void addNewPostGruppo(PostGruppo postg){
        try {
          
            Connection conn = DriverManager.getConnection(connectionString, "cri", "123");
            
            String query = 
                      "insert into post_gruppo (post_id, gruppo_id, autore_post_gruppo, content) "
                    + "values (default, ? , ? , ?)";
            
         
            PreparedStatement stmt = conn.prepareStatement(query);
            
          
            

            
            stmt.setInt(1, postg.getGruppo_id().gruppo_id);
            stmt.setString(3, postg.getContent());
            stmt.setInt(2, postg.getAutore_post_gruppo().getId());
            
         
            stmt.executeUpdate();
            
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void cancpostsgruppo(int post){
       
          try{
         Connection conn = DriverManager.getConnection(connectionString, "cri", "123");
            
            String query = 
                      "delete from post_gruppo "
                    + "where post_id = ?";
            
            // Prepared Statement
            PreparedStatement stmt = conn.prepareStatement(query);
            
            
            stmt.setInt(1, post);
            stmt.executeUpdate();
            
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public int getidPostByutenteandContent(String gid, String content){
        try
        {
            Connection conn = DriverManager.getConnection(connectionString, "cri", "123");
            // sql command
            String query = "select * from post_gruppo where "
                    + "gruppo_id = ? and content = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            // dati
            
            stmt.setString(1, gid);
            stmt.setString(2, content);
            //
            ResultSet set = stmt.executeQuery();

            
            if(set.next())
            {
              
        
               int id  = set.getInt("post_id");
           
                
                stmt.close();
                conn.close();
                return id;
            }
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
            
        return 0;
            
    }
    public void cancellaPostByutente(int gruppo){
         try{
         Connection conn = DriverManager.getConnection(connectionString, "cri", "123");
            
            String query = 
                      "delete from post_gruppo "
                    + "where autore_post_gruppo = ?";
            
            // Prepared Statement
            PreparedStatement stmt = conn.prepareStatement(query);
            
            
            stmt.setInt(1, gruppo);
            stmt.executeUpdate();
            
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    

}
