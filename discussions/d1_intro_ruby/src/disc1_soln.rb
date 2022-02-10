# We will be implementing a simple database using Ruby data structures to store the data.
# A database can contain an arbitrary number of tables. Each table will contain tuples of size n, where n is the number of columns in
# the table.
# Through a series of discussion exercises each week, we will improve upon our simple database.
# This week we will create a Database representation that will implement some basic functionality.
# The class Tuple represents and entry in a table.
# The class Table represents a collection of tuples.

class Tuple
    @@tupleHash = Hash.new(0)

    def initialize(data)
        @data = data;
        @@tupleHash[data.size] += 1
    end

    # This method returns the data at a particular index of a tuple (0 indexing)
    # If the provided index exceeds the largest index in the tuple, nil should be returned.
    # index is an Integer representing a valid index in the tuple.
    def getData(index)
        if index > (getSize() - 1) then
            nil
        else
            @data[index]
        end
    end

    # This method should return the number of tuples of size n that have ever been created
    def self.getNumTuples(n) 
        @@tupleHash[n]
    end
end

class Table
    # column_names is an Array of Strings
    def initialize(column_names)
        @column_names = column_names;
        @tuples = [];
    end

    # This method inserts a tuple into the table.
    # Note that tuples inserted into the table must have the right number of entries
    # I.e., the tuple should be the size of column_names
    # If the tuple is the correct size, insert it and return true
    # otherwise, DO NOT insert the tuple and return false instead.
    # tuple is an instance of class Tuple declared above.
    def insertTuple(tuple)
        col_length = @column_names.length();
        tuple_size = tuple.getSize;

        if tuple_size != col_length then
            false
        else
            @tuples.push(tuple);
            true
        end
    end
    
    def numRowsWhere(column,value)
        column_index = @column_names.index(column)
        result = 0

        for tuple in @tuples do
            if tuple[column_index] == value then
              results+=1

            end
        end
        result
    end
end