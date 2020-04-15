include "pry"

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    integer = input.to_i-1
  end
  
  def move(index,token="X")
    @board[index] = token
  end
  
  def position_taken?(input)
    @board[input] == " " ? false : true
  end
  
  def valid_move?(position)
    position.between?(0,9) && @board[position] == " " ? true : false
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    user_input = gets
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      puts "Please enter a valid move (1-9):"
      turn
    end
  end

  def won?
    won = nil
    WIN_COMBINATIONS.each do |combo|
      if @board.include?(combo)
        binding.pry
        won = combo
      end
    end
    won
  end
  
end