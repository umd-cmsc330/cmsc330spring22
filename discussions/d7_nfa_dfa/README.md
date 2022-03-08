# Discussion 7 - Friday, March 11<sup>th</sup>
 
## NFA, DFA, and Regex Explanation + Practice 

Worksheet.pdf, Disc 7 - Automata Algorithms.pdf (extra practice)

## NFA Accept
* NFAs vs. DFAs: What's the difference?
    * NFAs can have e transitions.
    * NFAs can have more than 1 transition on the same character from a state.

### Question 1
![nfa](nfa.png)
* Does the NFA accept "abab"?
* Here's how we process things:
    * For DFAs, as we read characters, we track which state we're on.
    * For NFAs, as we read characters, we track which states (PLURAL!) we COULD be on.
* Let's demonstrate:
    * Draw a stick figure on the start state. Let's call him Naruto.
    * Let's start w/ an e-closure.
        * Even before we read a character, we COULD be on any state reachable w/ e transitions.
        * So, Naruto clones himself and puts 1 clone on each state reachable w/ e transitions.
        * (draw the clones)
    * Let's read a character: 'a'
        * Each clone takes an 'a' transition.
            * If more than 1 'a' transitions exist, the clone clones himself and takes both transitions.
            * If no 'a' transitions exist, the clone dies.
            * (draw and erase the clones)
        * Then, we do an e-closure.
            * We do an e-closure after each character we read, cloning for each e-closure.
    * Read the rest of the characters: 'b', 'a', 'b'.
    * We ACCEPT if ANY clone is on ANY final state.
        * A clone on a final state shows that after reading "abab", we COULD be on that state. (The clone DID get to that state w/ "abab", after all.)
    * As we can see, there is a clone on state 6. We ACCEPT the string! 
* *As humans:* We can examine the NFA and find a path to a final state, like we just saw with this example.
* *But for a computer?* Our process is hard to code. (Who knows what our brains are doing!) Later we'll see it would be easier to code after converting to a DFA.

### Hints on NFA accept
- NFA accept is essentially e-closure, move, e-closure, move, ....e-closure. In other words, e-closure, (move, e-closure,)* e-closure.
- This will be key for future projects

## RE -> NFA conversion
* 3 basic operators: concatenation, union, kleene closure

### Question 2
* Convert the following regular expressions to NFAs.
    * ab*|a*|c*
    * c(a|b)*
    * (abc)+ (equivalent to abc(abc)*)
