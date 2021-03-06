require "./player"
require "./tile"
require "./land"
require "./dice"
require "./board"
require "./move"
require "./choose"

class Engine

  def initialize
    @player1 = Player.new("Sam")
    @board = Board.new
    @dice = Dice.new
    @move = Move.new


    puts @player1.name
    dice = @dice.roll
    @move.update_position(@player1,dice)

  # def turn(player1)
  # end
  # roll_dice
  # move_player
  #dice = Dice.new
  # test_tile_availability?
  # not to test: if player.position == tile.position

  if (@board.land_at(@player1.position)).available
    puts "Would you like to buy #{@board.land_at(@player1.position).name} for #{@board.land_at(@player1.position).value} pounds?"
    responce = gets.chomp.downcase
    if responce == "yes"
      @player1.buy_land(@board.land_at(@player1.position))
      puts "You now own:"
      @player1.land_list
      puts "Your balance is now #{@player1.balance}"
    else
      puts "you did not buy the land"
    end
  else
     @player1.pay_rent(@board.land_at(@player1.position).rent)
     puts "you have paid #{@board.land_at(@player1.position).rent} of rent"
  end
end

  # def roll_dice
  # end
end

engine = Engine.new
engine

