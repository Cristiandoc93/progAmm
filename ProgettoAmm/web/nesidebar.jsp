<%-- 
    Document   : nesidebar
    Created on : 16-apr-2017, 11.56.25
    Author     : Cristian
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


 <c:if test="${loggedOn == true && bacError != true}">

<div id="sidebar">
    <div id="persone" >
        
        <div id="myuser">
            Connesso come:<p class="user">  <img class="imgpro" alt="Foto di ${utentep.nome}" src="${utentep.urlfotoprofilo}">
                ${utentep.nome} </p>
        </div>
        
     
        <div class="titlebar">  
             <label for="ricerca">Barra di ricerca</label>
                         
             <input id="ricerca" type="text" value="">
         
          
        

      
            <p>Persone online</p>
        </div>
        
        
        
       
            
        <div class="listperscerc">
            
                
                <c:if test="${utente.nome != null &&
                              utente.cognome != null &&
                              utente.urlfotoprofilo != null &&
                              utente.presentazione != null}">
                      <ul id="utenti">
                               <c:forEach var="utente" items="${utenti}">
                                    <li nome="utente">${utente.nome} ${utente.cognome}
                                        <a href="bacheca.html?user=${utente.id}">
                                            
                                   
                                            bacheca
                                            
                                            
                                        </a>
                                    </li>
                               </c:forEach>
                      </ul> 
                      
                       <div class="titlebar">
                             <p>Gruppi</p>
                       </div>
                        <div class="titlebar">     
                        <form method="post" action="bacheca.html">
                        <input type="submit" name="makegroup" value="Crea il tuo gruppo!">
                        </form>
                       </div>
                       
                      <c:forEach var="gruppi" items="${gruppi}">
                      
                      
                          <p><a href="gruppo.html?group=${gruppi.gruppo_id}">
                                   ${gruppi.nome_gruppo}
                                  
                             </a></p>
                      </c:forEach>
                             
                             
            

                    
                </c:if>
            
        </div>    
            
            
      
        </c:if>
        
    </div> 
</div>



