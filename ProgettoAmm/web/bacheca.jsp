<%-- 
    Document   : bacheca
    Created on : 16-apr-2017, 11.21.25
    Author     : Cristian
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <title>.:Bacheca di ${utente.nome}</title>
        <meta charset="UTF-8">
        <meta name="author" content="Cristian">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="keywords" content="persone world future amici social">
        <link rel="stylesheet" type="text/css" href="style.css" media="screen">
    </head>
    
    <body>
        <div id="page">
            
        <div id="topbar">
        
       
        <jsp:include page="header.jsp"/>
        
        <c:set var="page" value="bacheca" scope="request"/>
        <jsp:include page="nav.jsp"/>
        
        </div>
        <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/javascript.js"></script>
        <jsp:include page="nesidebar.jsp"/>
        
             
           
            <div id="content">
                
                <%-- conferma gruppo --%>
                <c:if test="${confgr != null}">
                    
                <div id="post">
                          
                    
                    <div class="posts">
                        <div class="author">
                        <h3>Hai creato il gruppo!</h3>
                        </div>
                        
                           
                        
                    </div>
                    
                </div>
                    
                </c:if>
                
                <%-- pagina crea gruppo --%>
                
                

                 <c:if test="${makegroupok != null}">
                     
                      <div id="profileform">
                
                  <div id="titleform">
                  <p>Crea il tuo gruppo!</p>
                
                  </div>
                     
                 <form method="post" action="bacheca.html">
                      <div class="labeltrick">
                      <label for="nome_gruppo">Nome Gruppo</label>
                      </div>
                      <input name="nome_gruppo" id="nome_gruppo" type="text"/>
                      <input type="text" hidden name="nome_gruppo" value="${nome_gruppo}">
                      <br/>
                      
                       <div class="labeltrick">
                      <label for="data_creazione">Data creazione</label>
                      </div>
                      <input name="data_creazione" id="data_creazione" type="date"/>
                      <input type="date" hidden name="data_creazione" value="${data_creazione}">
                      <br/>
        
                      <input type="submit" name="Conf" value="Crea">
                 
                  </form>
                      </div>
                      
                 </c:if>
                
                
                <%-- pagina conf canc post amm --%>
                
                <c:if test="${cancfinito != null}">
                <div id="post">
                          
                    
                    <div class="posts">
                        <div class="author">
                        <h3>Hai cancellato questo post!</h3>
                        </div>
                        
                            <p> ${postcance}</p>
                        
                    </div>
                    
                </div>
                 
                </c:if>
                
                
                <%-- pagina di invio post --%>
                
                <c:if test="${invioPost != null}">
                <div id="post">
                          
                    
                    <div class="posts">
                    <form action="bacheca.html?user=${utente.id}" method="post">
                        <p class="sumPost"> ${nome} sta scrivendo nella bacheca di ${utente.nome}</p>
                        <div id='summaryPost'>
                        <p> ${wrPost} </p>
                        <p> ${urlPost} </p>
                        </div>
                        <input type="text" hidden name="newpost" value="${content}"> 
                        <input type="url" hidden name="urlP" value="${url}">
                        <input type="submit" name="sendpost" value="Invia post">
                    </form>       
                    </div>
                    
                </div>
            
                </c:if>
                
                
                
                
             
                
                <%-- caso messaggio inviato ---%>
                
                <c:if test="${sendPostok != null}">
                <div id="post">
                          
                    
                    <div class="posts">
                    
                        <p class="sumPost">Hai scritto sulla bacheca di ${utente.nome}</p>
                        
                       
                        </div>
                        
                    
                       
                    </div>
                    
                
            
                </c:if>
                
                <%-- Utente non connesso --%>
                
                <c:if test="${loggedOn != true}">
                    
                    <div id="errorProfile">
                        <p> Accesso negato </p>
                        <br/>
                        <p> Devi prima loggarti! </p>
                    </div>
                    <div id="content" class="nascosto">
                        
                    </div>
                    <div id="post" class="nascosto">
           
                    </div>
                    
                </c:if>
                
                <%-- Utente connesso attributi mancanti--%>
                
                <c:if test="${loggedOn == true && bacError != null}">
                    <c:if test="${utente.nome == null || 
                                  utente.cognome == null ||
                                  utente.urlfotoprofilo == null ||
                                  utente.presentazione == null }">
                    <div id="errorProfile">
                        <p> Accesso negato </p>
                       
                        <p> Devi prima finire il tuo profilo! </p>
                    </div>
                    <div id="content" class="nascosto">
                        
                    </div>
                    <div id="post" class="nascosto">
           
                    </div>
                    </c:if>
                </c:if>
                
           
                
                <%-- Utente connesso --%>
                
                <c:if test="${loggedOn == true && invioPost == null && sendPostok == null && 
                              cancfinito== null && makegroupok == null && confgr == null}">
                    
                    <div id="presTop">
                        ${utente.presentazione}
                       
                        
                     
                    </div>
                        <c:if test="${same == false}">
                        <c:if test="${amiciziaok == false}">
                     <div id="addfriends">
                         
                            tu e ${utente.nome} non siete amici ! 
                            
                            <form onclick="" onsubmit=""action="bacheca.html?user=${utente.id}" method="post">
                            <input type="submit" name="addfr" value="aggiungi amico">
                            </form>
                            
                        
                     </div>
                            
                         </c:if>
                       
                            
                         </c:if>
                        
                 <c:if test="${amiciziaok == true || same == true}">       
                <div id="newPost">
                                
                    <form action="bacheca.html?user=${utente.id}" method="post">

                        <label for="newpost">Scrivi un nuovo post sulla bacheca di ${utente.nome}</label>
                        <br/>

                      <textarea name="newpost" id="newpost"></textarea>
                      <label for="urlP"> Puoi anche aggiungere un allegato!</label>
                      <input name="urlP" id="urlP" type="url"/>
                      <br/> 
                      <input type="url" hidden name="urlP" value="${url}">
                      <input type="text" hidden name="newpost" value="${content}">
                      <input type="submit" name="inviapost" value="Scrivi">
                    </form>
                </div>
                      
                 </c:if>
                   
                <div id="post">
                    
                    
                    
                    
                <c:forEach var="post" items="${posts}">    
                    <div class="posts">
                       
                        
                        <div class="author">
                            <img class="imgp" alt="Foto di ${post.autore.nome}" src="${post.autore.urlfotoprofilo}">
                            <h3>${post.autore.nome} ${post.autore.cognome}</h3>
                          
                        </div>
                        
                        
                        <p> 
                          
                            
                            ${post.content}
                            
                            
                        </p>
                        
                        <c:if test="${amm != null}">
                            <form action="bacheca.html?user=${utente.id}" method="post">
                                <input type="text" hidden name="ute" value="${post.user.id}">
                                <input type="text" hidden name="contentx" value="${post.content}">
                                <input type="submit" name="cancposts" value="Cancella post">
                            
                          
                            </form>
                        </c:if>
                        
                    </div>
                </c:forEach>  
                </div>
                        
       
              
                      
                </c:if>
                
             
            </div>
            
        </div>  
        <jsp:include page="footer.jsp"/>
             
    </body>

</html>
