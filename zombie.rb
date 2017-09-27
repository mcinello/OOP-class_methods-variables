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
    #3 possible outcomes

    #1. escape unscathed
    if self.outrun_zombie? == true
      puts "You escaped!"

    #2. being killed by the zombie
    elsif self.survive_attack? == false && self.outrun_zombie? == false
    puts "You dead."

    #3 catching the plague and becoming a zombie yourself
    elsif self.outrun_zombie? == false
     self.spawn
     @@horde << self
     puts "You need braiiiiiiiiiiiiin."

    end

  end

  def outrun_zombie?
    human_speed = @@max_speed.rand(6)
    if human_speed > @speed
      return true
    else
      return false
    end
  end

  def survive_attack?
    am_i_strong = @@max_strength.rand(9)
    if am_i_strong > @strength
      return true
    else
      return false
  end

end
