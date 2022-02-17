# We will be implimenting a simple database table using Ruby data structures to store the data.
# The class Tuple represents an entry in a table.
# The class Table represents a collection of tuples.

class Tuple

    # data is an array of values for the tuple
    def initialize(data)
        raise "unimplemented"
    end

    # This method returns the data at a particular index of a tuple (0 indexing)
    # If the provided index exceeds the largest index in the tuple, nil should be returned.
    # index is an Integer representing a valid index in the tuple.
    def getData(index)
        raise "unimplemented"
    end

    # This method should return the number of tuples of size n that have ever been created
    # hint: you should use a static variable
    # hint2: a hash can be helpful (though not strictly necessary!)
    def self.getNumTuples(n) 
        raise "unimplemented"
    end
end

class Table
    # column_names is an Array of Strings
    def initialize(column_names)
        raise "unimplemented"
    end

    # This method inserts a tuple into the table.
    # Note that tuples inserted into the table must have the right number of entries
    # I.e., the tuple should be the size of column_names
    # If the tuple is the correct size, insert it and return true
    # otherwise, DO NOT insert the tuple and return false instead.
    # tuple is an instance of class Tuple declared above.
    def insertTuple(tuple)
        raise "unimplemented"
    end
    
    # Given a column name and a value, this method finds the number of rows where the value 
    # for the column matches the given value.
    def numRowsWhere(column,value)
        raise "unimplemented" 
    end 

end