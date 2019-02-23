class Owner
 @@all = []
 
 attr_reader :species
 attr_accessor :name, :pets
 
 def initialize(species)
   @species = species
   @name = ""
   @pets = {fishes: [], dogs: [], cats: []}
   @@all << self
 end
 
 def self.all
   @@all
 end
 
 def self.count
   @@all.length
 end
 
 def self.reset_all
   @@all.clear
 end
 
 def say_species
   "I am a #{self.species}."
 end
 
 def buy_fish(name)
   fish = Fish.new(name)
   @pets[:fishes] << fish
 end
 
 def buy_cat(name)
   cat = Cat.new(name)
   @pets[:cats] << cat
 end
 
 def buy_dog(name)
   dog = Dog.new(name)
   @pets[:dogs] << dog
 end
 
 def walk_dogs
   @pets[:dogs].each do |dog|
     dog.mood = "happy"
   end
 end
 
 def play_with_cats
   @pets[:cats].each do |cat|
     cat.mood = "happy"
   end
 end
 
 def feed_fish
   @pets[:fishes].each do |fish|
     fish.mood = "happy"
   end
 end
 
# owner.pets.each {|type, pets| expect(pets.empty?).to eq(true) }
#         [fido, tabby, nemo].each { |o| expect(o.mood).to eq("nervous") }
 
 def sell_pets
   @pets.each do |type, pets|
     pets.each do |pet|
       pet.mood = "nervous"
     end
     pets.clear
   end
 end
 
 def list_pets
   "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
 end
   
end