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
end

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []