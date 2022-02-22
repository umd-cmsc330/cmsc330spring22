(* Typing Practice  *)


1) let f x y = x + y

int -> int -> int 



2) let f x y = [x; y]

'a -> 'a -> 'a list



3) 
let f a = 
  if a then 1 else "hi"

INVALID - Can't have two different return types



4) 
let f a b = 
  if a then 0 else b

bool -> int -> int



5) 
let f a b c = 
  let d = "hi" ^ a ^ b ^ c in 
    d == "hello"

String -> String -> String -> bool



(* Creating functions *)


1) float -> float -> float

Ex.
let f a b = a +. b



2) 'a -> 'b -> 'b list

Ex. 
let f a b = [b]



3) int -> float -> int

Ex. 
let f a b = if b = 0.1 then a else 1



4) 'a -> 'a -> 'a list

Ex. 
let f a b = [a; b]



(* Records and New Types  *)


1) 
type hello = (str * int)

let a: hello = ("a",5)


2) 
type Coin = Heads | Tails

let b: Coin = Heads

3) 
type date = {month: string, day: int}

let today = {day=16; year=2017}

today.day