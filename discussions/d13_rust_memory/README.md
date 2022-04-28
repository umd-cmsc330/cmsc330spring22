# Discussion 13 - Friday, April 22<sup>nd</sup>

## What are the problems with Rust? 

* As noted last week, Rust has two primary features: ownerships and mutability 
* However (as you might have noticed) dealing with these is tough, especially for larger programs

### Ownership Issues 

* What if we want multiple people to have ownership over a single data point? 
  * E.g. A graph, where multiple nodes have ownership over a common neighbor
  * Note we can't just use references here; once we have a reference, we can't edit the object till the reference goes out of scope

  ``` rust 
  let mut a = String::from("hello")
  let b = &a;
  a.push_str("b"); //  Not allowed
  ``` 



* What if we want ownership over dynamically sized objects? 
* What if we want some passed in variable to guarantee some property? 
    * We need some type of wrapper over Trait 

### Mutability Issues

* What if we want multiple editors for an object?

### How do we fix these problems? 

## Box, Rc, and RefCell

### Issue 1: 
Can we store dynamically sized elements, say for example, LinkedLists? 

  * This should be done on the heap (where dynamically sized things are stored)
  * We can use Box, which basically wraps around variables, and allows them to reside on the heap
    * `E.g. Box::new(String::from("hello"))`
  * Then we can treat this like a normal variable, apply operations, etc.
  * Note that any need for dereferencing is largely handled by the compiler
  * Why is this useful? Two things: 
    * Recursive types: 

    ``` rust 
	LinkedList {
		Cons(i32,Box<LinkedList>)
	} 
    ```
      * If we don't have the box, then compiler won't allow it, as it's unknown how large LinkedList is
      * It's similar to how we use pointers for LinkedLists in C
      * Basically we create a pointer, which is of constant size, rather than LinkedList itself
    * Traits:
      * `fn hello(Box<dyn Summarizable>)`
      * Basically allows us to force input types to have certain properties + methods


### Issue 2: 
What if we want variables to have multiple owners?

  * This is possible through Rc or reference count
    * `let a = Rc::new(String::from("hello"))`
    * `let b = a.clone()`
    * Now a and b can view String

### Issue 3: 
What if we want variable to have multiple owners, and the variable is editable?

  * We can use RefCell, which allows for on-the-fly mutability
  * What does this mean? 
    * `let a = Rc::new(RefCell::new("Hello"))`
    * `let b = a.clone()`
    * `a.borrow_mut().push_str("hi")`
    * Updates everywhere
  * Rc let's us have multiple copies, and RefCell allows interior mutability/changes to whatever is referenced

### In summary
  * `Box` - Wrapper so variable property/size are standardized
  * `Rc` - Shares object by counting references, no one owner
  * `Refcell` - Allows for editing whatever is referenced by Rc

## Graph Exercise

Say we want to make a simple Node class with left child, right child, and data (i32), and parent properties, AND be able to do something along the following: 

``` rust
let a = Node {
	data: 1,
	parent: None,
	left: None, 
	right: None
};

let b = Node {
	data: 0,
	parent: None,
	left: None, 
	right: None
};

a.left = b;
b.parent = a;
```

What types do we use? 

``` rust 
struct Node {
	data: i32,
	left: Node,
	right: Node,
	parent: Node,
} 
```

Nope, can't do this, we can't define Node with Node

``` rust 
struct Node {
	data: i32,
	left: Box<Node>,
	right: Box<Node>,
	parent: Box<Node>,
} 
```

Nope, can't do this, ownership issue, as `a` owns `b`, and `b` owns `a`

``` rust 
struct Node {
	data: i32,
	left: Box<Node>,
	right: Box<Node>,
	parent: Box<&Node>,
}
```

Nope, then the parent can never be modified

``` rust 
struct Node {
	data: i32,
	left: Rc<Node>,
	right: Rc<Node>,
	parent: Rc<Node>,
} 
```

Then the node is static, and so won't update as the Node updates

``` rust 
struct Node {
	data: i32,
	left: Rc<RefCell<Node>>,
	right: Rc<RefCell<Node>>,
	parent: Rc<RefCell<Node>>,
} 
```

Yay! This works. 

### What's the big takeaway?

Box, Rc, and RefCell can help us develop tools for complex data structures, such as Graphs, allowing us to get around some of the complex ownership and mutability issues safely
