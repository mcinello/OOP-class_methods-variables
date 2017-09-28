class Vampire

  @@coven = []

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = false
  end

  def self.create(name, age)
    new_vampire = Vampire.new(name, age)
    @@coven << new_vampire
    return new_vampire
  end

  def self.coven
    @@coven
  end

#drank_blood_today, means they went outside
  def drink_blood
    @drank_blood_today = true
  end

  #if they finished drinking blood, they should go home before they sparkle
  def go_home
    @in_coffin = true
  end

#they sparkled. hoomans know. they need to be destroyed.
  def self.sunrise
    @@coven.each do |vamp|
      #if they didn't drink blood      #if they're not home
      if !vamp.drink_blood || !vamp.go_home
      end
    @@coven.delete(vamp)
    end
  end

  #time for a huntin'
  def self.sunset
    @@coven.each do |vamp|
        vamp.drink_blood = false
        vamp.go_home = false
      end
    return @@coven
  end

  def drink_blood=(blood)
    @drank_blood_today = blood
      return @drank_blood_today
  end

  def go_home=(coven)
    @in_coffin = coven
    return @in_coffin
  end
end

=begin

order of OUTPUT

new Vampire
drink blood status
sunset
drink blood
go home
sunrise - who's still out? sun elimination

=end

edward = Vampire.create('Edward', 100)
lestat = Vampire.create('Lestat', 2000)

puts Vampire.coven.inspect
puts Vampire.sunset.inspect
edward.drink_blood
lestat.go_home
puts Vampire.coven.inspect
puts Vampire.sunrise.inspect
