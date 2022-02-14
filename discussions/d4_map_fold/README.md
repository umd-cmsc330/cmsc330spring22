# Discussion 4 - Friday, February 18<sup>th</sup>

## Map and Fold Explained

* Map and fold are higher order functions that allow you to manipulate lists easily
* Map applies some function to each element of a list
    * map (fun x -> x*2) [1;2;3;4] -> [2;4;6;8]
    * map (fun x -> x^"a") ["a";"b";"c";"d"] -> ["aa";"ba";"ca";"da"]
* Fold - Loop through a list, and aggregate data from list 
    * fold (fun a x -> a+x) 0 [1;2;3;4] -> 1+2+3+4 -> 10
    * fold (fun a x -> x::a) [] [1;2;3;4] -> 4::(3::(2::(1::[]))) -> [4;3;2;1]
* We can do fold from the left side (fold fun a lst) or from the right side (fold fun lst a)
    * In most situations they're the same, but for non-commutative things like list appending, which one you select matters

## Problems

**Tuple concatenation** - Given a list of tuple pairs consisting of strings, create a list of strings

_Type:_ (string*string) list -> string list

_Example:_ [("ab","cd"); ("hello ","world")] -> ["abcd";"hello world"]

**Average** - Given a list of integers, find the average (rounded to the nearest integer) 

_Type:_ int list -> int 

**Sentence Formation** - Given a list of tuples with strings, combine them into a sentence

_Type:_ (string,string) list -> string

_Example:_ [("ab","cd "); ("hello ","world")] -> "abcd hello world"

**Index** - Given a list of integers, return the element at that index

_Type:_ integer list -> integer -> integer

**Zip** - Given two lists, combine these lists into one, with each element consisting of a tuple from each list

_Type:_ integer list -> integer list -> (integer*integer) list

_Example:_ [4;5;6], [1;2;3] -> [(4,1);(5,2);(6,3)]

**List Difference** - Given two lists of integers, find the difference of lists

_Type:_ integer list -> integer list -> integer list

_Example:_ [4;5;6], [1;2;3] -> [3,3,3]
