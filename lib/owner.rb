require 'pry'

class Owner
attr_reader :species
attr_accessor :name, :pets
  @@all = []
  @@count = 0

def initialize(species)
  @name = name
  @species = species
  @pets = {fishes: [], cats: [], dogs: []}
  @@all << self
  @@count += 1
end

def self.count
  return @@count
end

def self.all
  @@all
end

def self.reset_all
  @@all.clear
  @@count = 0
end

def say_species
  "I am a #{@species}."
end


def buy_fish(fish_name)
  new_fish = Fish.new(fish_name)
  @pets[:fishes] << new_fish
end

def buy_cat(cat_name)
  new_cat = Cat.new(cat_name)
  @pets[:cats] << new_cat
end

def buy_dog(dog_name)
  new_dog = Dog.new(dog_name)
  @pets[:dogs] << new_dog
end

def walk_dogs
  @pets[:dogs][0].mood = "happy"
end

def play_with_cats
    @pets[:cats][0].mood = "happy"
end

def feed_fish
    @pets[:fishes][0].mood = "happy"
end

def sell_pets
  @pets.each do |animal_type, pets|
    pets.each do |pet|
    pet.mood = "nervous"
  end
  end
  @pets.clear
end

def list_pets
  "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
end

end
