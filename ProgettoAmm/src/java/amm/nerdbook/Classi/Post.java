/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package amm.nerdbook.Classi;

import java.util.ArrayList;

/**
 *
 * @author Cristian
 */
public class Post {
    

    
    protected int id;
    protected UtentiReg user;
    private String content;
    

    public Post() {
        id = 0;
        user = null;
        content = "";
        
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the user
     */
    public UtentiReg getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(UtentiReg user) {
        this.user = user;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    void setUser(ArrayList<UtentiReg> autore) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}


