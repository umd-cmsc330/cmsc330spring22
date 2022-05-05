# Project 5: Stark Suit Repair

Due: May 9, 2022 at 11:59pm (Late May 10, with *10% penalty*)

Points: 49 public, 51 semipublic

## Meta

### Ground Rules

**This is an individual assignment. You must work on this project alone.**

For this project you are allowed to use the library functions found in `std`, including `Vec`, `String`, `collections::HashMap`, and `Box`.

Also, you may not use any external crates for your implementation.

### Introduction

Tony Stark, a genius and master engineer who received his education at MIT, is best known under the alias Iron Man.  Stark built the Iron Man suit for his protection and went on to run his father's company, where he continues to improve his super suit.

You have been hired to work for Stark Industries!

Recently, Stark has been feeling skeptical of his suit's software.  Fearing for his safety, he decides to rewrite his code from C to Rust.  Rust is a type-safe language with no garbage collector where the developer does not have to worry about managing memory.  The proper amount of memory is promised to be allocated for you and objects are also deallocated for you too.  Typically unmanaged code has performance gains but is vulnerable to security risks such as buffer overflows where attackers can steal data or modify memory, as would happen in C if the code isn't managed properly.  However, in Rust, we can write fast/efficient unmanaged code AND be memory safe!

This is where you come in.  Stark is unfamiliar with the language and needs you to help him fix his suit as well as add some additional features.

### Project Files

* Rust Files
  * **src/lib.rs**: This file describes the structure of the Rust library you are making.  You should not modify it.
  * **src/basics.rs**: This file contains the functions you must implement for part 1.
  * **src/linkedlist.rs**: This file contains the functions you must implement for parts 2 and 3.
  * **src/communicator.rs**: This file contains the functions you must implement for part 4.
  * **tests/public/mod.rs**: These are the public tests.  Feel free to write your own.

### Compilation and Tests

In order to compile the project, simply run `cargo build`. To test, run `cargo test` in the root directory of the project. The tests won't run if any part of the project does not compile.

### Installing Rust and Cargo

If you are working in grace, run `module avail rust` every time you log in.

For instructions on installing Rust, please see the [Install Rust](https://www.rust-lang.org/tools/install) page.

### Debugging

VS Code comes with an [excellent](https://code.visualstudio.com/Docs/editor/debugging) [debugger](https://code.visualstudio.com/docs/introvideos/debugging#languages-articles). Its the button that looks like an insect next to a play button on the left sidebar. It needs a [seperate extension](https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb) to work with rust however.

## Project Sections

### Part 1: Basic Warmups

As mentioned earlier, Stark does not know the syntax of the rust language very well.  He attempted to write a few simple functions but failed to do so.

In this part of the project, you will be tasked with implementing the simple functions that Stark had trouble with.

`fn gauss(n: i32) -> i32`

* **Description**: Returns the sum 1 + 2 + ... + n.  If n is negative, return -1.
* **Examples**:

```rust
gauss(3) == 6
gauss(10) == 55
gauss(-17) == -1
```

`fn in_range(lst: &[i32], s: i32, e: i32) -> i32`

* **Description**: Returns the number of elements in the list that are in the range [s,e].
* **Examples**:

```rust
in_range(&[1,2,3], 2, 4) == 2
in_range(&[1,2,3], 4, 7) == 0
```

`fn subset<T: PartialEq>(set: &[T], target: &[T]) -> bool`

* **Description**: Returns true if target is a subset of set, false otherwise.
* **Examples**:

```rust
subset(&[1,2,3,4,5], &[1,5,2]) == true
subset(&[1,2,3,4,5], &[1,2,7]) == false
subset(&['a','b','c'], &[]) == true
```

`fn mean(lst: &[f64]) -> Option<f64>`

* **Description**: Returns the mean of elements in lst. If the list is empty, return None.
* **Examples**:

```rust
mean(&[2.0, 4.0, 9.0]) == Some(5.0)
mean(&[]) == None
```

`fn to_decimal(lst: &[i32]) -> i32`

* **Description**: Converts a binary number to decimal, where each bit is stored in order in the array.
* **Examples**:

```rust
to_decimal(&[1,0,0]) == 4
to_decimal(&[1,1,1,1]) == 15
```

`fn factorize(n: u32) -> Vec<u32>`

* **Description**: Decomposes an integer into its prime factors and returns them in a vector.  You can assume factorize will never be passed anything less than 2.
* **Examples**:

```rust
factorize(5) == [5]
factorize(12) == [2,2,3]
```

`fn rotate(lst: &[i32]) -> Vec<i32>`

* **Description**: Takes all of the elements of the given slice and creates a new vector.  The new vector takes all the elements of the original and rotates them, so the first becomes the last, the second becomes first, and so on.
* **Examples**:

```rust
rotate(&[1,2,3,4]) == [2,3,4,1]
rotate(&[6,7,8,5]) == [7,8,5,6]
```

`fn substr(s: &String, target: &str) -> bool`

* **Description**: Returns true if target is a subtring of s, false otherwise.  You should not use the contains function of the string library in your implementation.
* **Examples**:

```rust
substr(&"rustacean".to_string(), &"ace") == true
substr(&"rustacean".to_string(), &"rcn") == false
substr(&"rustacean".to_string(), &"") == true
```

`fn longest_sequence(s: &str) -> Option<&str>`

* **Description**: Takes a string and returns the first longest substring of consecutive equal characters.
* **Examples**:

```rust
longest_sequence(&"ababbba") == Some("bbb")
longest_sequence(&"aaabbb") == Some("aaa")
longest_sequence(&"xyz") == Some("x")
longest_sequence(&"") == None
```

### Part 2: Ocaml Style Linked list

#### Overview

In this part, you will be responsible for creating a linked list that can be read from multiple threads.

You may have implemented linked lists in C before. This exercise will be radically different, as functional style lists may share nodes (as in ocaml). While you will not manage memory directly (call `malloc`, `free`), you must consider how to share memory safely while upholding rust's invariants. By default, the borrow checker enforces memory is only accessible to one thread at a time. 

The list and list node types are mostly given to you. The challenge is to figure out what links between nodes look like. In C, these would be pointers. In garbage collected languages, these would transparently be references.

Rust has several types for handling memory that enforce different sets of rules for you. For example, `Box` follows the *normal* rust rules, but makes sure something is on the heap. When a Box is "dropped" (deleted), it takes care of freeing memory for you. [`Rc`](https://doc.rust-lang.org/std/cell/index.html) allows *multiple* handles to data. When the last handle is deleted, memory is freed, allowing a simple form of garbage collection. Rust calls types like these "smart pointers", because they control access to the data inside them while also managing memory. In C, these would all be normal pointers, and it would be the programmers responsibility to follow the rules. While rust has normal / c style pointers (and access to the allocator), you may not use them (they're disabled for the project).

Unlike C or a garbage collected language, you're code will mostly fail to compile instead of failing at runtime. It will be frustrating because you wont be able to test the code for this section until its (nearly) perfect.

#### Functions

* `pub fn peek(&self) -> Option<Armor>`

This function returns (a copy of) the element at the head of the list, assuming the list is not empty. Otherwise, we should return `None` to indicate the list is empty.

* `pub fn pop(&mut self) -> Option<Armor>`

This method removes and returns the first element of the list. Be careful to consider how to handle the case where this node is shared amongst other lists.

* `pub fn push(&mut self, component: Armor) -> ()`

This method adds an element to the head end of the list. Be careful to consider the case where other lists may be sharing any preexisting head node. Pushing to this list must not modify any sister lists that share other nodes. We return nothing.

### Part 3: Suit of Armor

When in a large battle with the rest of The Avengers, its important to quickly check on the health and status of ones armor. Stark wants to add a new feature to his suit that allows him to quickly determine if his suit if battle ready.

You *may* implement list traversal in order to complete this section, but it isn't necessary. Notice that Lists may be cloned *without* cloning the data inside (ie, lists may share nodes).

* `fn is_compatible(&self) -> bool`

Is compatible checks if the versions of the various armor pieces match the version of the suit. For example, a suit with version 6 should have parts of version 6.

* `fn repair(&mut self)`

This method is a bit tricky. Its the only one that modifies data inside lists. All armor pieces of components with *2* fields (damage and power level) should be restored to 100 power and made undamaged. You should only modify the armor if and only if the damaged field is true. Armor pieces that are not damaged, but have low power level should remain unmodified.

You need to figure out how to mutate pieces of armor without affecting what other threads are *currently* seeing. For example, say we have 2 threads (t1 and t2), each holding a list (l1 and l2). l1 contains armor pieces a and b, while l2 contains b only. If l1 is reading a, l2 should be free to modify / repair b. If another thread is reading / writing to an armor piece we are trying to access (read / write), we should immediately panic (similar to throwing an exception). For example, if t1 is reading b while we try to repair, theres nothing we can do. We should not wait for other threads to finish their turn. In the previous example, if t1 was accessing b, while t2 tried to repair it, t1 should panic.

**Examples**

```
Helmet(true) -> Helmet(true)
ChestPiece(true, 46) -> ChestPiece(false, 100)
ChestPiece(false, 73) -> ChestPiece(false, 73)
```

### Part 4: Communicator

Stark is often in communication with his suit.  The suit is programmed with an intelligent AI that is able to listen to Stark and translate his words into a coherent string.  Stark needs his AI to listen for specific key words to trigger an event.

You are provided with an enum for all the commands Stark's suit can respond to:

```rust
enum Command
{
    Power(bool,i32),  
    Missiles(bool,i32), 
    Shield(bool),   
    Try,              
    Invalid
}
```

In order for the enum to have any functionality associated with it, you must complete the implementation provided for you.

* `fn as_str(&self) -> String`

First, you will write a function **as_str** that operates when called from a Command enum.  This method will check which command is calling this function and return the command's string representation.  Below is a chart outlining how each command is to be converted, matching commands with regular expressions corresponding to its output string.

Command     |     String format
:- | :-
Power       |  /Power (increased\|decreased) by [0-9]+%/
Missiles    |  /Missiles (increased\|decreased) by [0-9]+/
Shield      |  /Shield turned (on\|off)/
Try         |  /Call attempt failed/
Invalid     |  /Not a command/

For the boolean value in Power, Missiles, and Shield, a true value corresponds to "increased" and "on" while a false value corresponds to "decreased" and "off".

* `fn to_command(s: &str) -> Command`

Lastly, you will write a function **to_command** that takes a string slice and converts it to a command.  Below is a chart outlining how the strings will be passed into this method.  You can assume that any string that does not match the regular expressions provided will be considered an Invalid command.

Command     |     String format
:- | :-
Power       |  /power (inc\|dec) \[0-9\]\+/
Missiles    |  /(fire\|add) \[0-9\]+ missiles/
Shield      |  /shield (on\|off)/
Try         |  /try calling Miss Potts/
Invalid     |  Anything else

As before, "inc", "add", and "on" correspond to a boolean value of true while "dec", "fire", and "off" correspond to a boolean value of false.

## Resources

Below we've listed some helpful links to functions you may want to consider using for your project.  

* [Rust Book](https://doc.rust-lang.org/stable/book/).
  * The Rust-lang online textbook is a terrific resource.  You can find just about anything you need for this project in the book.
  * Ch 15 is useful for part 2
* [Accessing data across threads][std::sync]
  * [Locks][RwLock]
  * [Reference Counting][Arc]
* [str][str]
* [iterators][iterators]: some notable functions being collect, enumerate, zip, filter, map
* [options][options]
* [Project Inspiration](https://rust-unofficial.github.io/too-many-lists/)

## Project Submission

The easiest way to submit is to navigate to the project directory and run `gradescope-submit`.

If you submit another way, you must submit the files `basics.rs`, `locator.rs`, and `communicator.rs` containing your solution. You may submit other files, but they will be ignored during grading. We will run your solution as individual tests just as in the provided public test file. **No tests will pass on the submit server if the project does not compile!**

Be sure to follow the project description exactly! Your solution will be graded automatically, so any deviation from the specification will result in lost points.

## Academic Integrity

Please **carefully read** the academic honesty section of the course syllabus. **Any evidence** of impermissible cooperation on projects, use of disallowed materials or resources, or unauthorized use of computer accounts, **will** be submitted to the Student Honor Council, which could result in an XF for the course, or suspension or expulsion from the University. Be sure you understand what you are and what you are not permitted to do in regards to academic integrity when it comes to project assignments. These policies apply to all students, and the Student Honor Council does not consider lack of knowledge of the policies to be a defense for violating them. Full information is found in the course syllabus, which you should review before starting.

[RwLock]: https://doc.rust-lang.org/std/sync/struct.RwLock.html
[Arc]: https://doc.rust-lang.org/std/sync/struct.Arc.html
[std::sync]: https://doc.rust-lang.org/std/sync/index.html
[str]: https://doc.rust-lang.org/std/primitive.str.html
[iterators]: https://doc.rust-lang.org/std/iter/trait.Iterator.html
[options]: https://doc.rust-lang.org/std/option/enum.Option.html
