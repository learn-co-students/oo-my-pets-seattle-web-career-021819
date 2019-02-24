require 'pry'
class Owner
  attr_reader :species, :name
  attr_accessor :pets

  @@all = []

  def initialize(species)
    @species = species
    @pets = {fishes: [],  cats: [], dogs: []}
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

def name
  @name
end

def name=(name)
  @name = name
end


def say_species
  return "I am a human."
end


def buy_fish(name)
  new_fish = Fish.new(name)
  @pets[:fishes] << new_fish
end



def buy_cat(name)
  new_cat = Cat.new(name)
  @pets[:cats] << new_cat
end

def buy_dog(name)
  new_dog = Dog.new(name)
  @pets[:dogs] << new_dog
end

def walk_dogs
  dog_array = @pets[:dogs]
  dog_array.each do |dog|
    dog.mood = "happy"
  end
end

def play_with_cats
  cat_array = @pets[:cats]
  cat_array.each do |cat|
    cat.mood = "happy"
  end
end

def feed_fish
  fish_array = @pets[:fishes]
  fish_array.each do |fish|
  fish.mood = "happy"
end
end

def sell_pets
  @pets.each do |type, pets|
    pets.each do |specific_pet|
      specific_pet.mood = "nervous"
    end
    pets.clear
  end
end

def list_pets
  fish_count = @pets[:fishes].count
  dog_count = @pets[:dogs].count
  cat_count = @pets[:cats].count
  return "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
end



end
