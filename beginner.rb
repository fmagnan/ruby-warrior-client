class Player
  
  def opposite(direction)
    if direction == :backward
      opposite = :forward
    else
      opposite = :backward
    end
  end

  def restore(warrior, direction) 
    if warrior.feel(direction).enemy?
      warrior.walk!(opposite(direction))
    else
      warrior.rest!
    end
  end
  
  def fight!(warrior, direction)
    if warrior.feel(direction).enemy?
      warrior.attack! direction
    else
      warrior.walk! direction
    end
  end

  def play_turn(warrior)
    currentHealth = warrior.health
    direction = :forward

    if warrior.feel(direction).captive?
      warrior.rescue!(direction)
    elsif warrior.feel(:forward).wall?
      warrior.pivot! :backward
    elsif currentHealth < 17 or currentHealth == 20
      fight!(warrior, direction)
    else
      restore(warrior, direction)
    end
  end

end