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
        <jsp:include page="nesidebar.jsp"/>
        
        
           
            <div id="content">
                
                
                <%-- pagina di invio post --%>
                
                <c:if test="${invioPost != null}">
                <div id="post">
                          
                    
                    <div class="posts">
                    <form action="bacheca.html?user=${utente.id}" method="post">
                        <p class="sumPost"> ${nome} sta scrivendo nella bacheca di ${utente.nome}</p>
                        <div id='summaryPost'>
                        <p> ${wrPost} </p>
                        </div>
                        
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
                
                <c:if test="${loggedOn == true}">
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
                
                <c:if test="${loggedOn == true && invioPost == null && sendPostok == null}">
                <div id="newPost">
                    
                <form action="bacheca.html?user=${utente.id}" method="post">

                    <label for="newpost">Scrivi un nuovo post sulla bacheca di ${utente.nome}</label>
                    <br/>

                  <textarea name="newpost" id="newpost"></textarea>
                    
                    
                    <input type="submit" name="inviapost" value="Scrivi">
                </form>
                </div>
                   
                <div id="post">
                <c:forEach var="post" items="${posts}">    
                    <div class="posts">
                        <div class="author">
                            <img class="imgp" alt="Foto di ${utente.nome}" src="${utente.urlfotoprofilo}">
                            <h3>${utente.nome} ${utente.cognome}</h3>
                        </div>
                        
                        
                        <p> 
                            ${post.content}
                        </p>
                        
                    </div>
                </c:forEach>  
                </div>
                      
                </c:if>
            </div>
            
        </div>  
        <jsp:include page="footer.jsp"/>
             
    </body>

</html>
