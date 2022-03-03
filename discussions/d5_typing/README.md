# Discussion 5 - Friday, February 25<sup>th</sup>

## OCaml Typing / Currying



How do OCaml functions work internally? 
* When we have a function `let f x = x*x`, this is stored internally as: `let f = fun x -> x*x`
    * The type for this is `int -> int`; the first argument taken in is an integer, and it returns an integer (the return type being the very last type in the function type)
* With multiple arguments, say `let f x y = x*y`, this is internally as: `let f = fun x -> fun y -> x*y`
    * The type for this is `int -> int -> int`
    * Two ways to understand this: function takes in two arguments (two ints) and returns an int
    * Or function takes an int, and returns a function with type `int -> int`
        * This is the key idea of **Currying**, we turn multi-argument function into multiple single argument ones
* With typing, if type is ambiguous, use 'a, 'b, etc., like `let f x = x` `(type: 'a -> 'a)`

Why is all this important?
* Helps us understand what happens under the hood of OCaml, and how languages function

## Typing Practice

1. 
`let f x y = x + y`


2. 
`let f x y = [x; y]`


3. 
```ocaml 
let f a = 
if a then 1 else "hi"
```


4. 
```ocaml 
let f a b = 
if a then 0 else b
```


5. 
```ocaml 
let f a b c = 
let d = "hi" ^ a ^ b ^ c in 
d == "hello"
```

**Creating functions**

1. 
`float -> float -> float`


2. 
`'a -> 'b -> 'b list`


3. 
`int -> float -> int`


4. 
`'a -> 'a -> 'a list`


**Composite Types + custom Types**



* In addition to basic types (int, string, etc.) we can define our own types
    * `type hello = (str * int)` or `type coin = Heads | Tails`
    * `let a: hello = ("a",5)`, `let b: coin = Heads`
    * Can do pattern matching with this
* Other types include
    * Records: `type date = {month: string; day: int}`
    * `let today = {day=16; year=2017}`
    * To access fields, do `today.day`

## Examples
Tuples

`let x = (1, "hello")`

Records
```ocaml 
type student_information = 
{
    name : string;
    age : int;
}
```
