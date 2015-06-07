{shared{
     type escamotable = ([`Div] Eliom_content.Html5.elt) *
			  ([`Div] Eliom_content.Html5.elt)
   }}
			      

{client{
     let toggle element =
       let elt = Eliom_content.Html5.To_dom.of_element element in
       if Js.to_bool (elt##classList##contains(Js.string "visible"))
       then elt##classList##remove(Js.string "visible")
       else elt##classList##add(Js.string "visible")

     let init (titre, contenu) =
       let open Lwt_js_events in
       let open Eliom_content.Html5 in
       async (fun () ->
	      clicks (To_dom.of_element titre)
		     (fun _ _ ->
		      let () = toggle contenu in
		      Lwt.return ())
	     )       
   }}
  
let make contenu_titre contenu_contenu init_fct =
  let open Eliom_content.Html5 in
  let titre = D.div ~a:[F.a_class ["titre"]]
		    [contenu_titre] in
  let contenu = D.div ~a:[F.a_class ["contenu"]]
		      [contenu_contenu] in
  let () = init_fct (titre, contenu) in
  D.div ~a:[D.a_class ["escamotable"]] [titre ; contenu]
