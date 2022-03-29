# Discussion 10 - Friday, April 1<sup>st</sup>

## Coding Excercise (20 minutes)
* To go from source code to a running program, there are 3 steps (at least for our purposes):
    * Tokenizing/Lexing (separating text into smaller tokens)
    * Parsing (generating something meaningful from the tokens - an AST)
    * Interpreting (evaluating the result of the AST) 

* Consider the following grammar:
    * S -> M + S | M
    * M -> N * M | N
    * N -> n | (S)
    * where n is any integer

* Briefly go over how this grammar is right associative/recursive (Why did we provide a right associative grammar? What would you do if we didn't?). Explain what associativity means if students don't remember.

* What is the relative precedence of the + and \* operators here? How is it determined? How can we use CFGs to enforce precedence?

### Lexer
* Open `lexer.skeleton.ml`.
* Answer key in `lexer.ml`
* Show students the variant type `token` that we have defined.
* Explain the general approach of having an index that keeps track of where we are in the string, and moves forward as we keep tokenizing.
* In P5, they will have to worry about the order in which they have their `if/else` ... `if/else` (certain regexs should be checked before others).
* It's probably also a good idea to just define all the regex's and store in variables at the top.

### Parser
* Open `parser.skeleton.ml`.
* Answer key in `parser.ml`
* Show students the variant type `expr` that we have defined
* Note: Use `let rec ...` and to write mutually recursive functions.
* Note: `lookahead` just returns the head of the list.
* Note: `match` just "consumes" the head of the list (provided that the token and head of the list match).
* IMPORTANT: Explain this approach to students before going over the functions:
    * We're going to write a function named `parse_X` for each nonterminal `X` in our grammar.
    * Each of these functions will parse (consume) some tokens, and return (1) the unparsed tokens and (2) the AST which corresponds to the parsed tokens.

NOTE: We have also provided a worksheet on CFGs and Parsing for more practice, but no need to cover this unless you have extra time at the end

## Operational Semantics Explanation (10 minutes)
Basically, we're trying to systematically understand how programs evaluate parsed statements

## Operational Semantics Problems (20 minutes)
Worksheet on operational semantics - ignore the evaluator problem, we'll cover that next week 



## Interpreter - NOT COVERED YET 
Mostly self explanatory. Just explain why we need to call `eval` within the `Mult` and `Plus` branches.
