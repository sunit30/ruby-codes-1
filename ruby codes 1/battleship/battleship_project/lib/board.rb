class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
           puts row.join(" ")
        end
    end

    def initialize(n)
        @grid=Array.new(n){Array.new(n){:N}}
        @size=n*n
    end

    def [](array)
        @grid[array[0]][array[1]]
    end

    def []=(array,value)
        @grid[array[0]][array[1]]=value
    end

    def num_ships
        count=0
        (0...@grid.length).each do |i|
        count+=@grid[i].count(:S)
        end
        count
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts "you sunk my battleship!"
            return true
        else
             self[position] = :X
            return false
        end
    end

    def place_random_ships
        while self.num_ships<(@size/4) 
            i=rand(0...@grid.length)
            j=rand(0...@grid.length)
            self[[i,j]] = :S
        end
    end

    def hidden_ships_grid
        hidden_array=@grid.map do |row|
            row.map do |column|
                if column ==:S
                    :N
                else
                    column
                end
             end
         end
        
        hidden_array
    end

    def cheat
        puts Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
