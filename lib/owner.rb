class Owner

attr_reader :species, :name
attr_accessor :pets

@@all = []
@@count = 0


  def initialize(species)
    @species = species
    @@all << self
    @@count += 1
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@all.clear
    @@count = 0
  end

  def say_species
    "I am a #{@species}."
  end

  def name=(name)  #setter
    @name = name
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

  def feed_fish
    fish_array = @pets[:fishes]  #assign array of fish for easy reading
      fish_array.each do |fish|  #go through each fish
        fish.mood = "happy"
      end
      fish_array
  end

  def play_with_cats
    cat_array = @pets[:cats]
      cat_array.each do |cat|
        cat.mood = "happy"
      end
      cat_array
  end

  def walk_dogs ##update dog moods to happy
    dog_array = @pets[:dogs] #array of dogs
      dog_array.each do |dog|
        dog.mood = "happy"  #update the dog's mood instance var
      end
     dog_array
  end

  def sell_pets
    @pets.each do |breed, array| #go through each
      array.each do |animal|  #go through array of animals
        animal.mood = "nervous"  #update mood to nervous
      end
      array.clear  #clear out the array after updating moods
    end
  end

  def list_pets
    fish_count = @pets[:fishes].length
    dog_count = @pets[:dogs].length
    cat_count = @pets[:cats].length
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

end
