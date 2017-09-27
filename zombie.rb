class Zombie

  @@horde = [] #collection of zombies
  @@plague_level = 10 #determine rate at which new zombies are spawned (icnrease)
  @@max_speed = 5 #max value for speed attribute of any zombie. This will NOT change
  @@max_strength = 8 #max value for strength. won't change
  @@default_speed = 1 #won't change
  @@default_strength = 3 #won't change

  #CLASS METHODS ----------------------------------------------------------

  def self.all
    @@horde
  end

#events of another day in the zombie apocalypse
  def self.new_day**
    Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plague_level
  end

#deletes zombies from array
  def self.some_die_off
    @@horde.delete_at(rand(11)) #should i do @@horde.length instead?
  end

  #generates new zombies
  def self.spawn(speed, strength)
    @@plague_level.rand(11)
    new_zombie = Zombie.new
    @speed = speed.rand(6)
    @strength = strength.rand(4)
    @@horde << new_zombie
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
    return @@plague_level
  end

  #INSTANCE METHODS ---------------------------------------------------

  def initialize(speed, strength)
    @speed = speed
    @strength = strength

    if speed > @@max_speed
      @speed = @@default_speed
    elsif strength >= @@max_strength
      @strength = @@default_strength
    end

  end

  def ecounter

  end

  def outrun_zombie?

  end

  def survive_attack?

  end

end
