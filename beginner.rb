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

  def is_enemy_in_range(warrior, direction)
    spaces = warrior.look
    is_enemy_in_range = false
    for space in spaces
      if space.enemy?
        is_enemy_in_range = true
      end
    end
  end

  def first_encounter(warrior, direction)
    spaces = warrior.look

    for space in spaces
      unless space.empty?
        first_encounter=space
      end
    end

    return first_encounter
  end

  def release_prisoner(warrior, direction)
    if (warrior.feel(direction).captive?)
      warrior.rescue!(direction)
    else
      warrior.walk!(direction)
    end
  end

  def play_turn(warrior)
    currentHealth = warrior.health
    direction = :forward
    first_encounter = first_encounter(warrior, direction)

    if first_encounter.nil?
      warrior.walk!(direction)
    elsif first_encounter.captive?
      release_prisoner (direction)
    elsif first_encounter.enemy?
      warrior.shoot!(direction)
    elsif warrior.feel(:forward).wall?
      warrior.pivot! :backward
    elsif currentHealth < 17 or currentHealth == 20
      fight!(warrior, direction)
    else
      restore(warrior, direction)
    end
  end

end