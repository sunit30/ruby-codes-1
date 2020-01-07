require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board , :player
    attr_writer :remaining_misses

    def initialize(length)
        @player=Player.new
        @board=Board.new(length)
        @remaining_misses=@board.size/2
    end

    def start_game
        board.place_random_ships
        puts "there are #{board.num_ships} hidden ships"
        board.print
    end

    def lose?
        if @remaining_misses <=0
            puts "you lose"
            true
        else
            false
        end
    end

    def win?
        if board.num_ships == 0
            puts "you win"
            true
        else false
        end
    end

    def game_over?
         self.win? || self.lose?
    end

    def turn
       position = @player.get_move
       if !board.attack(position)
        @remaining_misses-=1 
       end
        board.print
        puts "#{@remaining_misses} remaining misses"
    end


end
