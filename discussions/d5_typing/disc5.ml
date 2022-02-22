(* Typing Practice  *)


1) let f x y = x + y

2) let f x y = [x; y]

3) 
let f a = 
  if a then 1 else "hi"

4) 
let f a b = 
  if a then 0 else b

5) 
let f a b c = 
  let d = "hi" ^ a ^ b ^ c in 
    d == "hello"


(* Creating functions *)


1) float -> float -> float

2) 'a -> 'b -> 'b list

3) int -> float -> int

4) 'a -> 'a -> 'a list


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