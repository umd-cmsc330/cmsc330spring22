# Solution from Fall 2019 Final Exam
# (http://www.cs.umd.edu/~anwar/cmsc330_tests/final-soln-fall19.pdf)
class WaitingTime
    def initialize(filename)
    	@wait_time = {}
        File.foreach(filename) do |line|
        	if line=~/([A-Z][a-z]+), ([A-Z][a-z]+), (\d+):(\d\d)/
        		if @wait_time[$2+" "+$1] == nil
        			@wait_time[$2+" "+$1] = 0
            end 
            
            @wait_time[$2+" "+$1]+=$3.to_i*60+$4.to_i
            end 
        end
    end
    
    def student_waited_for(student_name)
    	if @wait_time[student_name] != nil
    		return @wait_time[student_name] 
    	else
    		return 0
    	end 
    end
    
    def total_wait_time()
    	S = 0
    	@wait_time.each do |k,v|
    		s+=v 
    	end 
    	return s
    end
end

# Solution from Fall 2018 Final Exam
# (http://www.cs.umd.edu/~anwar/cmsc330_tests/final-soln-fall2018.pdf)
class DuckSorter
    def initialize(filename)
        @ducks = Hash.new []
        IO.foreach(filename) { |line|
            if line =~ /name:([A-Z][a-z]+), attributes:([a-z]+(, [a-z]+)*)/
                @ducks[$1] += $2.split(", ")
                @ducks[$1].uniq!
            end
        }
    end

    def get_attribute(name) 
        @ducks[name]
    end

    def search(attribute)
        arr = []
        @ducks.each{ |k, v|
            if v.include?(attribute)
                arr.push(k)
            end
        }
        arr
    end
end