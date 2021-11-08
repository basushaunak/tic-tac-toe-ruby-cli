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
  def initialize(player1, player2)
    @score = []
    @players = []
    for a in 0..8 do
      @score.push("")
    end
    display_score()
		@finalscore = {player1.name => 0, player2.name => 0}
		@players.push(player1)
		@players.push(player2)
  end

  public

  def display_score()
    puts "-------------"
    str = "|" + (@score[0] == "" ? " 1 " : " " + @score[0] + " ") 
    str = str + "|" +  (@score[1] == "" ? " 2 " : " " + @score[1] + " ")
    str = str + "|" + (@score[2] == "" ? " 3 " : " " + @score[2] + " ")
    str = str + "|"
    puts str
    puts "|-----------|"
    str = "|" + (@score[3] == "" ? " 4 " : " " + @score[3] + " ")
    str = str + "|" + (@score[4] == "" ? " 5 " : " " + @score[4] + " ")
    str = str + "|" + (@score[5] ==  "" ? " 6 " : " " + @score[5] + " ")
    str = str + "|"
    puts str
    puts "|-----------|"
    str = "|" + (@score[6] == "" ? " 7 " : " " + @score[6] + " ")
    str = str + "|" + (@score[7] == "" ? " 8 " : " " + @score[7] + " ")
    str = str + "|" + (@score[8] == "" ? " 9 " : " " + @score[8] + " ")
    str = str + "|"
    puts str
    puts "-------------"
  end

  public
    
  def set_score(in_player, position)
    pos = position - 1
    @score[pos] = in_player.marker
    display_score()
  end

  public 

  def game_over?(player)
    marker = player.marker
    if @score[0] == marker
      if (@score[1] == marker && @score[2] == marker)
        update_score(player)
        return true
      end
      if (@score[3] == marker && @score[6] == marker)
        update_score(player)
        return true
      end
      if (@score[4] == marker && @score[8] == marker)
        update_score(player)
        return true
      end
    end
    if @score[1] == marker
      if (@score[4] == marker && @score[7] == marker)
        update_score(player)
        return true
      end
    end
    if @score[2] == marker
      if (@score[5] == marker && @score[8] == marker)
        update_score(player)
        return true
      end
      if (@score[4] == marker && @score[6] == marker)
        update_score(player)
        return true
      end
    end
    if @score[3] == marker
      if (@score[4] == marker && @score[5] == marker)
        update_score(player)
        return true
      end
    end
    if @score[6] == marker
      if (@score[7] == marker && @score[8] == marker)
        update_score(player)
        return true
      end
    end
    return false
  end

  def game_drawn?
    if game_over = nil && empty_count = 0
      return true
    end
		# Work pending here
  end

  def empty_count
    ctr = 0
    @score.each do |marked|
      ctr += 1
    end
    return ctr
  end

	def available_slots
		slots = []
		@score.each_with_index do |slot, idx|
			if slot == "" 
				slots.push(idx+1)
			end
		end
		return slots
  end

  private

  def update_score(player)
    @finalscore[player.name] += 1
  end
end

class Player
	attr_reader :name, :marker
	def initialize(name,marker)
		@name=name
		@marker=marker
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
		puts "Player 1: #{player1_name}. Marker: #{player1_marker}"
		puts "Player 1: #{player2_name}. Marker: #{player2_marker}"
		player1 = Player.new(player1_name, player1_marker)
		player2 = Player.new(player2_name, player2_marker)
		p player1
		puts ""
		p player2
		puts ""
		game = TicTacToe.new(player1, player2)
		puts game.available_slots.join("/") + ": "
  end
end

include Game
Game.play
