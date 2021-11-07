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
    def initialize()
        @score = []
        for a in 0..8 do
            @score.push("")
        end
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
        if in_player.length != 1
            return -2 # Invalid player
        end
        player = in_player.upcase()
        if (player != "O" && player != "X")
            return -2 # Invalid player
        end
        if @score[pos] != ""
            return -1 # Position already taken
        end
        @score[pos] = player
        display_score()
    end

    public 

    def game_over()
        if @score[0] != ""
            var = @score[0]
            if (@score[0] == var && @score[0] == var)
                return var
            end
            if (@score[3] == var && @score[6] == var)
                return var
            end
            if (@score[4] == var && @score[8] == var)
                return var
            end
        end
        if @score[1] != ""
            var = @score[1]
            if (@score[4] == var && @score[7] == var)
                return var
            end
        end
        if @score[2] != ""
            var = @score[2]
            if (@score[5] == var && @score[8] == var)
                return var
            end
            if (@score[4] == var && @score[6] == var)
                return var
            end
        end
        if @score[3] != ""
            var = @score[2]
            if (@score[4] == var && @score[5] == var)
                return var
            end
        end
        if @score[6] != ""
            var = @score[2]
            if (@score[7] == var && @score[8] == var)
                return var
            end
        end
        return nil
    end

    def game_drawn?
        if game_over = nil && empty_count = 0
            return true
        end
        
    end

    def empty_count
        ctr = 0
        @score.each do |marked|
            ctr += 1
        end
        return ctr
    end

end

game = TicTacToe.new()
game.display_score()
game.set_score("X",1)
game.set_score("O",2)
game.set_score("X",4)
game.set_score("O",3)
game.set_score("X",7)
game.set_score("O",5)
