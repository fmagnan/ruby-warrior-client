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
    elsif currentHealth < 17 or currentHealth == 20
      fight!(warrior, direction)
    elsif currentHealth < 20
      restore(warrior, direction)
    end
  end

end