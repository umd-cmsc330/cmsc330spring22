# Discussion 6 - Friday, March 4<sup>th</sup>

## Closures



* How do functions work? For example, if `let f x y = x+y`, what happens when we call `f 2`? 
* Internally, what happens is, a closure is created, which binds x -> 2, and stores the code/function `fun y -> x+y`
* Understanding closures and variable bindings is important to understand how functions work, and are key to concepts like partial applications
* Closures are especially important for recursive functions:
* Say we have: `let rec f x = if x = 0 then 1 else x*(f (x-1))`
    * When this is run, OCaml sees the keyword `rec` and initially creates a variable, f->0
    * Then it will store the inner part of the function as a closure, with no variables 
    * Finally let f -> this closure, and return it
    * When the function is run, we add a variable to the environment and evaluate the code
* The concept of closures will be a key idea in later projects

**Examples and Expalanations (Covered during discussion)**

1) 
* What will `f 3` return? 
* In f, x is bound to the number 2 within the function closure statically and locally
* When f is called, it uses this closure binding rather than the most recent or global version of x
* Thus, `f 3` will use `x = 2` and return 5

2) 
* Closures are good for nested functions or partial applications
* Partial application and currying in OCaml means OCaml functions really only take one parameter
* The example represents `int -> (string -> bool)`, meaning if you only pass in one argument to the above function, it returns another function `(string -> bool)`
* Since OCaml functions are closures, when you pass in one argument, it binds that argument in the closure and returns a new function with that binding in it

3) 
* Can’t use recursion, so automatically think map or fold
* Since we are operating on every element, we’ll use map
* The + operator and other operators are functions in OCaml
* `+: int -> int -> int`
* This means `(+) 3` returns a function of type `(int -> int)`
* Map the + function using n to the list
* Answer: `add_n n lst = List.map ((+) n) lst`
* Try it with an example: `add_n 3 [1; 2; 3] -> [4; 5; 6]`


## Imperative OCaml and Mutability 


We always discuss how everything in OCaml is immutable. Sometimes it is useful for values to change, like for a counter or an array

**Examples and Expalanations (Covered during discussion)**

1) 
* References in OCaml are like pointers in C
* Use the ref function to allocate a reference to some space in memory
* In the example, z is 3, and x points to a space in memory with value 3
* Note that the binding of the variable is immutable. We can’t change x, only what x is pointing to

2)
* `!` is a function used to dereference a reference 
* Using the variables from 1), `!x` returns 3

3) 
* `:=` is a function used to change the contents of a reference 
* Using the variables from 1), `x := 4` sets the memory space x refers to to 4
* Does this change the value of z? 
* No, x and z are disjoint

4) 
* What does `!y` return?
* Using the variables from 1), when we do `let y = x`, we bind y to the same memory location as x, so x and y become aliases
* This is an example of aliasing, using a reference to change the value of another reference
* Thus, when we set x to 4, we change the memory location for both x and y
* Thus, `!y` returns 4
* Note that z is still 3 

5) 
* Recall that `;;` is how we end an OCaml expression in Utop or a program
* A single semicolon operates like the comma operator in C
* It evaluates all the expressions separated by a semicolon, then returns the last expression
* In this example, it evaluates both print statements, then returns 0
* This prints “Hello” and “World”, and returns `number = 0`, so the final output of the second statement is 0 + 1 = 1
* One recommendation: might want to group the semicolon expressions with `begin … end` or `()` for clarity in scoping 

6) 
* We can also make the fields of a record mutable, alongside these individual variables
* We declare the field as mutable if we want to be able to change them 
* In this example, color is a mutable field, so we can change it even after setting it
* `p.color <- “white”` is valid because color is a mutable field
* `p.x <- 1` is invalid, though, because x is immutable 
* If you still have 30 minutes left, administer the quiz. Otherwise, all done! 
