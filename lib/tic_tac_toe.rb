
class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize
        @board = Array.new(9, " ")
    end
    
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index( input )
        index = input.to_i - 1
    end

    def move( index, token="X" )
        @board[index] = token
    end

    def position_taken?( index )
        @board[index] != " " ? true : false
    end

    def valid_move?( index )
        # --- Refactored ---
        index.between?(0,9) && !position_taken?( index ) ? true : false

        # --- Original ---
        # if index < 0 || index > 8
        #     false
        # else
        #     position_taken?( index ) ? false : true
        # end
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index( input )
        # token = current_player
        if valid_move?( index )
            move( index, current_player )
            display_board
        else
            turn
        end 
    end

    def turn_count
        counter = 0
        @board.each do |position|
            if position != " "
                counter += 1
            end
        end
        counter
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
        # --- Refactored ---
        WIN_COMBINATIONS.detect{ |combo| @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " " }
        
        # --- Original ---
        # WIN_COMBINATIONS.each do |combo|
        #     if ((@board[combo[0]]=="X" && @board[combo[1]]=="X" && @board[combo[2]]=="X") ||
        #         (@board[combo[0]]=="O" && @board[combo[1]]=="O" && @board[combo[2]]=="O"))
        #         return combo
        #     end
        # end
        # false
    end

    def full?
        @board.all?{ |index| index != " " }
    end

    def draw?
        full? && !won? ? true : false
    end

    def over?
        draw? || won? ? true : false
    end

    def winner
        # --- Refactored ---
        !won? ? nil : @board[won?[0]]

        # --- Original ---
        # winner = nil
        # if draw? == over?
        #     winner
        # elsif won?
        #     winner = current_player == "X" ? "O" : "X"
        # end
        # winner
    end

    def play
        until over? do
            turn
        end
        
        # --- Refactored ---
        puts won? ? "Congratulations #{ winner }!" : "Cat's Game!"
        
        # --- Original ---
        # if( won? )
        #     puts "Congratulations #{ winner }!"
        # elsif( draw? )
        #     puts "Cat's Game!"
        # end
    end
end