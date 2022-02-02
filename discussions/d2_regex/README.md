# Discussion 2 - Friday, February 4<sup>th</sup>

## What are Codeblocks and Regex?

Codeblocks: Package code and pass it in as a variable
The fundamental idea is passing code as data

`a = [1,2,3,4]`

`a.each do **|x| puts x end**`

`a.each {|x| puts x}`

Internally, this is done through yield commands, which run passed in code block 


Regular Expression: Used to match strings and extract information

For example, `"abc1" =~ /(\w+)(\d)/` matches the letters and numbers separately 

`/(\w+)(\d)/` generally matches one or more letters followed by one number

The first part, `"abc"`, is stored in variable `$1`, and `"1"` is stored in `$2` (backreferencing)

Internally, this is done through automata, which we'll implement later

To test out Regex, use: [https://rubular.com/](https://rubular.com/) (note this uses Ruby-specific regex; other languages, like OCaml, might have small differences)

## Codeblock Problems

1) Waiting Time problem: [http://www.cs.umd.edu/~anwar/cmsc330_tests/final-fall19.pdf](http://www.cs.umd.edu/~anwar/cmsc330_tests/final-fall19.pdf) 


2) Ducks problem: [http://www.cs.umd.edu/~anwar/cmsc330_tests/final-fall18.pdf](http://www.cs.umd.edu/~anwar/cmsc330_tests/final-fall18.pdf)
