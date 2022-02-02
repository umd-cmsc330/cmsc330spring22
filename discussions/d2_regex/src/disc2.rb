class WaitingTime
    def initialize(filename)
      raise "unimplemented" 
    end
    
    def student_waited_for(student_name)
      raise "unimplemented"
    end
    
    def total_wait_time()
      raise "unimplemented" 
    end
end

class DuckSorter
    def initialize(filename)
      IO.foreach(filename) { |line| 
        raise "unimplemented" 
      }
    end

    def get_attribute(name) 
      raise "unimplemented" 
    end

    def search(attribute)
      raise "unimplemented" 
    end
end