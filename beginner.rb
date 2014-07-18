class Player
  
  def restore warrior
    if warrior.feel(:forward).enemy?
      warrior.walk! :backward
    elsif warrior.feel(:backward).enemy?
      warrior.walk! :forward
    else
      warrior.rest! 
    end
  end
  
  def fight_archer warrior
    if warrior.feel(:forward).enemy?
      warrior.attack! :forward
    elsif warrior.feel(:backward).enemy?
      warrior.attack! :backward
    else
      warrior.walk! :backward
    end
  end

  def free_prisoner warrior
    if warrior.feel(:forward).captive?
      warrior.rescue! :forward
    elsif warrior.feel(:backward).captive?
      warrior.rescue! :backward
    end
  end

  def play_turn(warrior)
    currentHealth = warrior.health

    free_prisoner warrior

    if currentHealth < 18
      restore warrior
    else
      fight_archer warrior
    end
  end

end