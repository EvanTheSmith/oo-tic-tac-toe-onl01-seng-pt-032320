class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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
    input.to_i-1
  end
  
  def move(index,token="X")
    @board[index] = token
  end
  
  def position_taken?(input)
    @board[input] == " " ? false : true
  end
  
  def valid_move?(position)
    position.between?(0,8) && @board[position] == " "
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    loop do
    user_input = gets
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index,current_player)
      display_board
      break
    else
      puts "Please enter a valid move."
    end
    end
  end

def won? # Returns true if there is a win and false otherwise
  WIN_COMBINATIONS.each do |win_combo|
   if @board[win_combo[0] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X" || @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
    return win_combo
   end
  end
  false
end

def full? # Returns true if board is full
  @board.none? {|check| check == " "}
end

def draw?
  full? && !won? ? true : false
end
  
def over?
draw? || won?
end

def winner
won? ? current_player == "X" ? "O" : "X" : nil
end

def play
turn until over?
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end
  
end