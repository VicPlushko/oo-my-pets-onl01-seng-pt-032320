class Owner
  attr_reader :name, :species
 
 @@all = []
 
 def initialize(name)
   @name = name
   @species= "human"
   save
 end
 
 def save
   @@all << self
 end
 
 def say_species
  "I am a #{species}."
 end
 
 def cats
   Cat.all.select {|kitty| kitty.owner == self }
 end
 
 def dogs
   Dog.all.select {|pup| pup.owner == self}
 end
 
 def buy_cat(name)
   Cat.new(name, self)
 end
 
 def buy_dog(name)
   Dog.new(name, self)
 end
 
 def walk_dogs
   self.dogs.each {|pups| pups.mood = "happy"}
 end
 
 def feed_cats
   self.cats.each {|kitty| kitty.mood = "happy"}
 end
 
 def sell_pets
   self.dogs.each {|pups| pups.mood = "nervous"}
   self.cats.each {|kitty| kitty.mood = "nervous"}
   self.dogs.each {|pups| pups.owner = nil}
   self.cats.each {|kitty| kitty.owner = nil}
 end
 
 def list_pets
   self.dogs.cats.all
 end
 
 def self.all
  @@all
 end
 
 def self.count
   @@all.count
 end
 
 def self.reset_all
   @@all.clear
 end
end