class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end

        self
    end

    def my_select(&prc) #  if num > 1
        newArr = [] 
        self.my_each do |ele|   # 1, 2, 3
            newArr << ele if prc.call(ele) # 
        end

        newArr
    end

    def my_reject(&block)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if !block.call(ele)
        end
        new_arr
    end

    def my_any?(&block) #return boolean
        self.each do |ele|
            return true if block.call(ele)
        end
        false
    end

    def my_all?(&block)
        self.each do |ele|
            return false if !block.call(ele)
        end
        true
    end
end

a = [1, 2, 3]
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true