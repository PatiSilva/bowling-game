class BowlingGame
  def initialize
    @rolls = []
  end

# Record a roll in the game.
#
#pins - The integer number of pins knocked downin this roll.
#
#Returns nothing.

  def roll(pins)
  	@rolls.push(pins)
  end

  # Returns the Integer score for this game.
  def score
    total_score  = 0
    current_roll = 0
    current_frame = 1

    while current_roll < @rolls.size - 1 
      roll      = @rolls[current_roll]
      next_roll = @rolls[current_roll + 1]

      if current_frame < 11
	      if roll == 10 
	        total_score += 10 + @rolls[current_roll + 1]
	        total_score += @rolls[current_roll + 2] if current_roll + 2 <= @rolls.size - 1
	        current_roll += 1
	      elsif roll + next_roll == 10
	        total_score += 10 + @rolls[current_roll + 2]
	        current_roll += 2  
	      else
	        total_score += roll + next_roll
	        current_roll += 2
	      end
	    else
	      current_roll += 1
	    end

	    current_frame += 1
	  end

    return total_score
  end

end

# (12 rolls: 12 strikes) = 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 = 300