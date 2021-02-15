class Owner
  @@all=[]
  attr_reader :name, :species, :pets

  def initialize(name)
    @name=name
    @@all << self
  end

  def species
    @species="human"
  end

  def say_species
    return "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all=[]
  end

  def cats
    Cat.all.select do |c|
      c.owner==self
    end
  end

  def dogs
    Dog.all.select do |d|
      d.owner==self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    arr=self.dogs
    arr.each do |dog|
      dog.mood="happy"
    end
  end

  def feed_cats
    arr=self.cats
    arr.each do |cat|
      cat.mood="happy"
    end
  end

  def sell_pets
    arrpets=self.cats+self.dogs
    arrpets.each do |pet|
      pet.mood="nervous"
      pet.owner=nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end




    

end





