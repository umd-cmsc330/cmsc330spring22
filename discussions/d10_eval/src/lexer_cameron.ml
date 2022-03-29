module L = List
module S = String
module R = Str
        
(* Type *)
type token =
| Tok_Int of int
| Tok_Mult
| Tok_Plus
| Tok_LParen
| Tok_RParen
| Tok_EOF

(* Regular expressions and the tokens they generate. *)
let re = [
  (R.regexp "[0-9]+" , fun x -> [Tok_Int (int_of_string x)]) ;
  (R.regexp "\\+" , fun _ -> [Tok_Plus]) ;
  (R.regexp "\\*" , fun _ -> [Tok_Mult]) ;
  (R.regexp "(" , fun _ -> [Tok_LParen]) ;
  (R.regexp ")" , fun _ -> [Tok_RParen]) ;
  (R.regexp " " , fun _ -> [])
]

(* Given source code returns a token list. *)
let rec lexer (s : string) : token list =
  lexer' s 0

(* Helper for lexer takes in a position offset. *)
and lexer' (s : string) (pos : int) : token list =
  if pos >= S.length s then [Tok_EOF]
  else
    let (_, f) = L.find (fun (re, _) -> R.string_match re s pos) re in
    let s' = R.matched_string s in
    (f s') @ (lexer' s (pos + (S.length s')))
