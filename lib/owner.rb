require 'pry'
class Owner
  attr_reader :species
  attr_accessor :name, :pets
  @@all = []

  def initialize(species)
    @species = species
    @pets = {cats: [], dogs: [], fishes: []}
    @@all << self
  end

  # Returns a phrase containing species of this instance
  def say_species
    "I am a #{@species}."
  end

  # Helper method for buying pet
  def buy_pet(name, pet_instance, key)
    pet = pet_instance.all.find {|pet| pet.name == name}
    pet ||= pet_instance.new(name) # If no existing pet by name, create new pet
    pet.owner = self
    @pets[key] << pet
  end

  # Sets owner of fish with given string name to this instance of Owner
  def buy_fish(name)
    buy_pet(name, Fish, :fishes)
  end

  # Sets owner of fish with given string name to this instance of Owner
  def buy_dog(name)
    buy_pet(name, Dog, :dogs)
  end

  # Sets owner of fish with given string name to this instance of Owner
  def buy_cat(name)
    buy_pet(name, Cat, :cats)
  end

  # Helper method for playing with pets
  def play_with_pets(pet)
    @pets[pet].each do |pet|
      pet.mood = "happy"
    end
  end

  # Changes mood of all dogs belonging to owner to happy
  def walk_dogs
    play_with_pets(:dogs)
  end

  # Changes mood of all cats belonging to owner to happy
  def play_with_cats
    play_with_pets(:cats)
  end

  # Changes mood of all fish belonging to owner to happy
  def feed_fish
    play_with_pets(:fishes)
  end

  # Clear owner from pets and change mood
  # And clear all pets from owner's pets
  def sell_pets
    @pets.values.map! do |pets|
      pets.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end

      pets.clear
    end
  end

  # Return a string that includes the number
  # of each pet in the owner's pets
  def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s)," +
    " and #{pets[:cats].length} cat(s)."
  end

  # Returns the number of all instances of Owner
  def self.count
    @@all.count
  end

  # Clears the list of Owner instances
  def self.reset_all
    @@all.clear
  end

  def self.all
    @@all
  end
end
