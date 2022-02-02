# Discussion 1 - Friday, January 28<sup>th</sup>
 

## Introduction

We created a Ruby exercise which has you work with some of the features you learned about in class. The focus here is on the problem solving process itself, and particularly the following steps: 


1. Problem Understanding: can you break down a set of instructions into manageable tasks
2. Algorithmic Planning: can you develop pseudocode or a sketch of the code 
3. Implementation and information retrieval: can you implement the solution, and more importantly, find resources to help you (documentation) when stuck

We'll walk you through some of these steps for some parts of the problem, and have you work your own way through others. 

## Instructions

We will be implementing a simple database using Ruby data structures to store the data. A database is used to store data in an ordered manner, and an example is shown below. A database consists of a set of columns (in this case name and age), and some number of tuples (in this case, 4 tuples). Each tuple has a value for each column; for example, the first tuple in the database, (A,22), corresponds to a datapoint with name A and age 22. In particular, we plan to implement features for the database so users can read and write data. 

An example of a table is below: 

| Name |  Age | 
|------|------|
|  A   |  22  |        
|  B   |  23  |     
|  C   |  24  |        
|  D   |  21  |   

## Part 1: `Tuple`

A `Tuple` represents a single entry, in a table.  The methods below will be implemented in the `Tuple` class in [disc1.rb](src/disc1.rb).

#### `initialize(data)`

- **Type**: `(Array) -> _`
- **Description**: Given an array of values for the tuple, store them in the `Tuple` object in any way you would like.  You should perform any initialization steps for the `Tuple` instance here.  The return value of this function does not matter.
- **Examples**:
  ```ruby
  t = Tuple.new(["a", 1, "b", 2])
  t = Tuple.new([])                # Tuples may be empty 
  ```

#### `getData(index)`

- **Type**: `(Integer) -> Object`
- **Description**: Return the data at a particular index of a `Tuple` (indexed starting at 0).  If the provided index exceeds the largest index in the tuple, return `nil`.
- **Assumptions**: `index` is non-negative.
- **Examples**:
  ```ruby
  t = Tuple.new(["a", 1, "b", 2])
  t.getData(0)                     # Returns "a"
  t.getData(4)                     # Returns nil
  ```

#### `self.getNumTuples(n)`

- **Type**: `(Integer) -> Integer`
- **Description**: Return the number of `Tuple`s of size `n` that have ever been created.  Hint: you should use a static variable to keep track of this.
- **Examples**:
  ```ruby
  Tuple.getNumTuples(3)         # Returns 0
  t = Tuple.new(["a", 1, "b"])
  t = Tuple.new(["a", 1, "b"])
  Tuple.getNumTuples(3)         # Returns 2
  t = Tuple.new([3])
  Tuple.getNumTuples(3)         # Returns 2
  ```
  
## Part 2: `Table`
A `Table` represents a collection of tuples.  The methods below will be implemented in the `Table` class in [disc1.rb](src/disc1.rb).

#### `initialize(column_names)`

- **Type**: `(Array) -> _`
- **Description**: Given an array of column names for the `Table`, store them in the object in any way you would like. You should perform any initialization steps for the `Table` instance here.  The return value of this function does not matter.
- **Assumptions**: The elements in `column_names` will be unique.
- **Examples**: 
  ```ruby
  t = Table.new(["c0", "c1", "c2"])
  t = Table.new([])
  ```

#### `insertTuple(tuple)`

- **Type**: `(Tuple) -> boolean`
- **Description**: Insert a `Tuple` into the `Table`.  Note that the number of entries in the `Tuple` must match the number of columns in the `Table`.  If this is not the case, make no changes to the `Table` and return `false`.  If the sizes match, insert the `Tuple` and return `true`.
- **Examples**:
  ```ruby
  table = Table.new(["a", "b"])
  x = Tuple.new([0, 1])
  y = Tuple.new([3, "y"])
  z = Tuple.new([1, 2, 3])

  table.insertTuple(x)  # Returns true
  table.insertTuple(y)  # Returns true
  table.insertTuple(z)  # Returns false (sizes do not match)
  ```

#### `numRowsWhere`

- **Type**: `(String,'t) -> Integer`
- **Description**: Given a column name and a value, find the number of rows where the value for the column matches the given value. 
- **Examples**
  ```ruby 
    table = Table.new(["a", "b"])
    x = Tuple.new([0, 1])
    y = Tuple.new([3,,1])
    z = Tuple.new([3,,4])
    table.insertTuple(x)
    table.insertTuple(y)
    table.insertTuple(z)
    table.numRowsWhere("b", 1) # 2 
  ```
  
