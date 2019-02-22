class Owner
  # code goes here
  attr_reader :species
  attr_accessor :name, :pets

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @pets = {
      :fishes => [],
      :dogs => [],
      :cats => []
    }
  end
  #
  # def create
  #   self.
  # end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def species
    @name
  end

  def say_species
    "I am a #{@name}."
  end

  def name=(name)
    @name = name
  end

  def pets
    @pets
  end


  def buy_fish(fish_name)
    fish_name = Fish.new(fish_name)
    pets[:fishes] << fish_name
  end

  def buy_cat(cat_name)
    cat_name = Cat.new(cat_name)
    pets[:cats] << cat_name
  end

  def buy_dog(dog_name)
    dog_name = Dog.new(dog_name)
    pets[:dogs] << dog_name
  end

  def walk_dogs
    pets[:dogs].each do |dog|
      dog.mood = 'happy'
    end
  end

  def play_with_cats
    pets[:cats].each do |cat|
      cat.mood = 'happy'
    end
  end

  def feed_fish
    pets[:fishes].each do |fish|
      fish.mood = 'happy'
    end
  end

  def sell_pets
    pets.each_value do |pet_array|
      pet_array.each do |pet|
        pet.mood = 'nervous'
      end
    end
    pets.clear
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

end
