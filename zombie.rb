require "pry"

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
  def self.new_day #delete vaariables and such. it's just generating new numbers. should look more simple
    Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plague_level
  end

#deletes zombies from array
  def self.some_die_off
    rand(11).times do
      @@horde.delete_at(0)
    end
  end

  #generates new zombies
  def self.spawn
    (rand(@@plague_level)+3).times do
    new_zombie = Zombie.new((rand(@@max_speed)+1), (rand(@@max_strength)+1))
    @@horde << new_zombie
    end
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
    return @@plague_level
  end

  #INSTANCE METHODS ---------------------------------------------------

  def initialize(speed, strength)

    if speed > @@max_speed
      @speed = @@default_speed
    else
      @speed = speed
    end

    if strength >= @@max_strength
      @strength = @@default_strength
    else
      @strength = strength
    end

  end

  def encounter
    #3 possible outcomes

    #1. escape unscathed
    if outrun_zombie? == true && survive_attack? == true
      puts "You escaped!"

    #2. being killed by the zombie
    elsif survive_attack? == false
      puts "You dead."

    #3 catching the plague and becoming a zombie yourself
    elsif outrun_zombie? == false && survive_attack? == true
      new_zombie = Zombie.new((rand(@@max_speed)+1), (rand(@@max_strength)+1)) #Zombie.spawn?
       @@horde << new_zombie
       puts "You need braiiiiiiiiiiiiin."

    end
  end

  def outrun_zombie?
    human_speed = (rand(@@max_speed)+1)

    if human_speed > @speed
      return true
    else
      return false
    end
  end

  def survive_attack?
    am_i_strong = (rand(@@max_strength)+1)
    if am_i_strong > @strength
      return true
    else
      return false
    end
  end

  def speed
    return @speed
  end

  def strength
    return @strength
  end

end

puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
