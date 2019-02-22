class Owner
  @@all=[]

  attr_reader :species
  attr_accessor :name, :pets
  
  def initialize (species)
    @species=species
    @pets={cats: [],dogs: [], fishes: [] }
    @@all.push(self)
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish (name)
    fish=Fish.new(name)
    @pets[:fishes].push(fish)
  end

  def buy_dog (name)
    dog=Dog.new(name)
    @pets[:dogs].push(dog)
  end

  def buy_cat (name)
    cat=Cat.new(name)
    @pets[:cats].push(cat)
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood="happy"}
  end

  def play_with_cats
    @pets[:cats].each {|dog| dog.mood="happy"}
  end

  def feed_fish
    @pets[:fishes].each {|dog| dog.mood="happy"}
  end

  def sell_pets
    @pets.each do |k, v|
      v.each do|pet|
        pet.mood="nervous"
      end
    end

    @pets.each do |k, v|
      v.clear
    end
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
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

end