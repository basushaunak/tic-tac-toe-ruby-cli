# Tic-Tac-Toe for TOP Assignment (Ruby)
# This is the diplay after user plays his move
#            -------------
#            | 1 | 2 | 3 |
#            |-----------|
#            | 4 | 5 | 6 |
#            |-----------|
#            | 7 | 8 | 9 |
#            -------------

class TicTacToe
  attr_reader :game_on
  def initialize(player1, player2)
    @grid = []
    @players = []
    for a in 0..8 do
      @grid.push("")
    end
    display_grid()
		@score = {player1.name => 0, player2.name => 0}
		@players.push(player1)
		@players.push(player2)
    @game_on = true
  end

  public

  private
  
  def display_grid()
    puts "-------------"
    str = "|" + (@grid[0] == "" ? " 1 " : " " + @grid[0] + " ") 
    str = str + "|" +  (@grid[1] == "" ? " 2 " : " " + @grid[1] + " ")
    str = str + "|" + (@grid[2] == "" ? " 3 " : " " + @grid[2] + " ")
    str = str + "|"
    puts str
    puts "|-----------|"
    str = "|" + (@grid[3] == "" ? " 4 " : " " + @grid[3] + " ")
    str = str + "|" + (@grid[4] == "" ? " 5 " : " " + @grid[4] + " ")
    str = str + "|" + (@grid[5] ==  "" ? " 6 " : " " + @grid[5] + " ")
    str = str + "|"
    puts str
    puts "|-----------|"
    str = "|" + (@grid[6] == "" ? " 7 " : " " + @grid[6] + " ")
    str = str + "|" + (@grid[7] == "" ? " 8 " : " " + @grid[7] + " ")
    str = str + "|" + (@grid[8] == "" ? " 9 " : " " + @grid[8] + " ")
    str = str + "|"
    puts str
    puts "-------------"
  end

  public
    
  def set_grid(in_player, position)
    pos = position - 1
    @grid[pos] = in_player.marker
    display_grid()
  end

  public 

  def over?(player)
    marker = player.marker
    if @grid[0] == marker
      if (@grid[1] == marker && @grid[2] == marker)
        update_score(player)
        @game_on = false
        return true
      end
      if (@grid[3] == marker && @grid[6] == marker)
        update_score(player)
        @game_on = false
        return true
      end
      if (@grid[4] == marker && @grid[8] == marker)
        update_score(player)
        @game_on = false
        return true
      end
    end
    if @grid[1] == marker
      if (@grid[4] == marker && @grid[7] == marker)
        update_score(player)
        @game_on = false
        return true
      end
    end
    if @grid[2] == marker
      if (@grid[5] == marker && @grid[8] == marker)
        update_score(player)
        @game_on = false
        return true
      end
      if (@grid[4] == marker && @grid[6] == marker)
        update_score(player)
        @game_on = false
        return true
      end
    end
    if @grid[3] == marker
      if (@grid[4] == marker && @grid[5] == marker)
        update_score(player)
        @game_on = false
        return true
      end
    end
    if @grid[6] == marker
      if (@grid[7] == marker && @grid[8] == marker)
        update_score(player)
        @game_on = false
        return true
      end
    end
    return false
  end
  
  public
  
  def drawn?
    if empty_count() == 0
      @game_on = false
      return true
    end
		# Work pending here
  end

  public
  
  def empty_count
    ctr = 0
    @grid.each do |marked|
      ctr += 1
    end
    return ctr
  end

  public

	def free_slots
		slots = []
		@grid.each_with_index do |slot, idx|
			if slot == "" 
				slots.push(idx+1)
			end
		end
		return slots
  end

  private

  def update_score(player)
    @score[player.name] += 1
  end

  public

  def return_score()
    return @score
  end

  public

  def next_game()
    for a in 0..8 do
      @grid[a] = ""
    end
    @game_on = true
    display_grid()
  end
end


class Player
	attr_reader :name, :marker
	def initialize(name,marker)
		@name=name
		@marker=marker
	end

  public

  def make_move(game)
    slots = game.free_slots()
    pos = 0
    print "#{@name}, enter a grid position [#{slots.join("/")}]: "
    pos = gets.chomp().to_i
    while slots.include?(pos) != true
      print "Invalid choice, select from #{slots.join("/")}: "
      pos = gets.chomp.to_i
    end
    game.set_grid(self, pos)
    if game.over?(self)
      puts "Woo Hoo! #{@name} won!"
      return true
    end
    if game.drawn?()
      puts "Game drawn!"
      return true
    end
  end
end

module Game
  def play
		message = "Welcome to the game of Tic-Tac-Toe!\n"
	  message = message + "This is a two player game. You can use 'X' or 'O' to mark your entry in the grid. "
	  message = message + "Whoever reaches three marks horizontally, vertically or diagonally first, wins the game."
    puts message
		player1_name = ""
		while player1_name.length == 0
			print "Enter Name of Player 1: "
			player1_name = gets.chomp()
		end
		player1_marker = ""
		while (player1_marker.length != 1 && player1_marker != "X" && player1_marker != "O")
			print "Enter Your choice (X/O): "
			player1_marker = gets.chomp.upcase
		end		
		player2_name = ""
		while player2_name.length == 0
			print "Enter Name of Player 2: "
			player2_name = gets.chomp()
		end
		player2_marker = player1_marker == "X" ? "O" : "X"
    puts "**************************************************"
		puts "Player 1: #{player1_name}. Marker: #{player1_marker}"
		puts "Player 1: #{player2_name}. Marker: #{player2_marker}"
    puts "**************************************************"
		player1 = Player.new(player1_name, player1_marker)
		player2 = Player.new(player2_name, player2_marker)
		game = TicTacToe.new(player1, player2)
    answer = "C"
    while answer == "C"
      while game.game_on() do
        player1.make_move(game)
        if game.game_on()
          player2.make_move(game)
        end
      end
      game.next_game()
      print "Type C & press 'Enter' to play another game: "
      answer = gets.chomp.upcase
    end
    final_score = game.return_score()
    puts "***********************"
    puts """""""FINAL SCORE******"
    puts "***********************"
    final_score.each do |key,value|
      puts "#{key}\t\t#{value}"
    end
    puts "***********************"
  end
end

include Game
Game.play
