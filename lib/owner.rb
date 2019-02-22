class Owner
  attr_reader :species
  @@all = []

  def initialize(species)
    @species = species
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

end
