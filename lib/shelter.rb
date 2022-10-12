class Shelter

  attr_reader :name, :capacity, :pets

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @pets = []
    @pet_call = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def patrons
    return @pets
  end

  def call_pets
    pets.each do |pet|
      @pet_call << pet + '!'
    end
    return @pet_call
  end

  def over_capacity?
    return true if @pets.length > @capacity
    false
  end

  def adopt
    pets.shift until @pets.length <= @capacity
  end

end
