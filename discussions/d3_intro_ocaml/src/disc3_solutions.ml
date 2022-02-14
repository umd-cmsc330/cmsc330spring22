let positive n = if n > 0 then "positive" else if n < 0 then "negative" else "zero" 

let double x = 2*x

let fizz n= if n mod 15 = 0 then "fizz buzz" else if n mod 3 = 0 then "fizz" else if n mod 5 = 0 then "buzz" else ""

let first_elem lst = match lst with 
| h::t -> h
| [] -> 0

let rec sum lst = match lst with 
| [] -> 0
| h::t -> h+sum t

let rec max_list lst = match lst with 
| [] -> 0
| h::t -> max h (max_list t)

let sum_tuple t = match t with 
| (a,b,c) -> a+b+c

let rec product lst = match lst with 
| [] -> 1
| h::t -> h * (product t)

let rec max_product lst = match lst with 
| [] -> 0
| h::t -> max (product h) (max_product t)

let rec length l = match l with 
| [] -> 0
| h::t -> 1+length t

let rec check_matrix_aux lst len = match lst with 
| [] -> true
| h::t -> if length h = len then check_matrix_aux t len else false

let check_matrix lst = match lst with 
| h::t -> check_matrix_aux lst (length h)
| [] -> true



