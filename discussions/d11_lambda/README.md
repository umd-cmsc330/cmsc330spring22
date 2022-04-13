# Discussion 11 - Friday, April 8<sup>th</sup>

## Operational Semantics
Reviewing Operational Semantics from last week - ask any questions!  

## Coding Excercise
* Recall from last week, to go from source code to a running program, there are 3 steps (at least for our purposes):
    * Tokenizing/Lexing (separating text into smaller tokens)
    * Parsing (generating something meaningful from the tokens - an AST)
    * Interpreting (evaluating the result of the AST) 

* Recall the following grammar:
    * S -> M + S | M
    * M -> N * M | N
    * N -> n | (S)
    * where n is any integer

## Interpreter 
* Open `interpreter.skeleton.ml`.
* Answer key in `interpreter.ml`
* General Approach: Make recursive calls to evaluate subexpressions

## Intro to Lambda Calculus - Explanation + Practice
