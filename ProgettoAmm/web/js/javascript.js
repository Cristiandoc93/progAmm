/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */






function aggiornaLista(utenti)
        {
            // Cancella la lista
            $("#utenti").empty();
       
            for(var utente in utenti)
            {
                
                
                // Crea link
                var link = document.createElement("a");
                link.setAttribute("href", "bacheca.html?user="+utenti[utente].id);
                
                var newli = document.createElement("li");
                newli.setAttribute("nome", "utente");
                // testo
                var text = document.createTextNode(utenti[utente].nome + 
                        " " + utenti[utente].cognome + " ");
                newli.appendChild(text);
                
                var bacheca = document.createTextNode("bacheca");
                link.appendChild(bacheca);
                newli.appendChild(link);
                
                // Aggiunge il tag li al tag ul
                $("#utenti").append(newli);
            }
        }




function stateFailure(data, state){
   console.log(state);
}


$(document).ready(function(){
   // document.getElementById('ricerca').onkeypress(function(){
    $("#ricerca").on('keyup', function(){
        
        var q = $("#ricerca")[0].value;
        
        $.ajax({
            url: "filter.json",
            data:{
                cmd: "search",
                text: q
            },
            dataType: 'json',
            success: function(data, state){
                aggiornaLista(data)
            },
            error: function(data, state){
                stateFailure(data, state)
            }
        });
    })
});


