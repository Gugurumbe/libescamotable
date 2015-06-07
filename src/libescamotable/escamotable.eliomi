{shared{
     
     type escamotable
	    
   }}
  
{client{

     
     val init: escamotable -> unit

	 
   }}

(** 

[Escamotable.make titre contenu init_js] crée un widget qui cache /
affiche le contenu lorsqu'on clique sur le titre.

Classes utilisées : le widget prend la classe [escamotable]. C'est une
division. Le titre est une division de classe [titre] qui contient
l'unique élément titre passé en argument, et le contenu est une
division de classe [contenu] qui contient l'unique élément contenu.

L'élément [contenu] prend ou non la classe [visible].

La fonction init_js doit être exactement [fun a -> ignore {unit{Escamotable.init %a}}].

 *)
val make: [< Html5_types.div_content_fun] Eliom_content.Html5.elt ->
	  [< Html5_types.div_content_fun] Eliom_content.Html5.elt ->
	  (escamotable -> unit) ->
	  [> Html5_types.div] Eliom_content.Html5.elt
			      
