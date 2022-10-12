# in pull request put name and w1 ic1 as title

require 'rspec'
require './lib/shelter'

RSpec.describe Shelter do

  # Iteration 1
  describe '#initialize' do
    it 'is a Shelter' do

      shelter = Shelter.new('Denver Animal Shelter', 5)
      expect(shelter).to be_a(Shelter)
    end

    it 'can read the name' do

      shelter = Shelter.new('Denver Animal Shelter', 5)
      expect(shelter.name).to eq('Denver Animal Shelter')
    end

    it 'can read the capacity' do

      shelter = Shelter.new('Denver Animal Shelter', 5)
      expect(shelter.capacity).to eq(5)
    end

    it 'has no pets by default' do

      shelter = Shelter.new('Denver Animal Shelter', 5)
      expect(shelter.pets).to eq []
    end
  end

  # Iteration 2
  describe '#add_pet' do
    it 'returns a list of pets' do

      shelter = Shelter.new('Denver Animal Shelter', 5)
      shelter.add_pet('Salem')
      shelter.add_pet('Beethoven')
      shelter.add_pet('Spot')
      shelter.add_pet('Jonesy')

      expect(shelter.pets).to eq(['Salem', 'Beethoven', 'Spot', 'Jonesy'])
    end
  end

  describe '#call_pets' do
      it 'returns a list of names with exclamation points appended' do

        shelter = Shelter.new('Denver Animal Shelter', 5)
        shelter.add_pet('Salem')
        shelter.add_pet('Beethoven')
        shelter.add_pet('Spot')
        shelter.add_pet('Jonesy')

# require 'pry'; binding.pry

        expect(shelter.call_pets).to eq(['Salem!', 'Beethoven!', 'Spot!', 'Jonesy!'])
      end
    end

    # Iteration 3
    describe '#over_capacity?' do
      it 'states true if more pets than stated capacity' do

        shelter = Shelter.new('Denver Animal Shelter', 3)
        shelter.add_pet('Salem')
        shelter.add_pet('Beethoven')

        expect(shelter.over_capacity?).to be false

        shelter.add_pet('Spot')
        shelter.add_pet('Jonesey')

        expect(shelter.over_capacity?).to be true
      end
    end

    # Iteration 4
    describe '#adopt' do
      it 'removes pet from shelter' do

        shelter = Shelter.new('Denver Animal Shelter', 3)
        shelter.add_pet('Salem')
        shelter.add_pet('Beethoven')
        shelter.add_pet('Spot')
        shelter.add_pet('Jonesy')

        expect(shelter.over_capacity?).to be true

# require 'pry'; binding.pry

        shelter.adopt

        expect(shelter.over_capacity?).to be false
      end

      it 'continues to remove UNTIL no longer over capacity' do
        
        shelter = Shelter.new('Denver Animal Shelter', 1)
        shelter.add_pet('Salem')
        shelter.add_pet('Beethoven')
        shelter.add_pet('Spot')
        shelter.add_pet('Jonesy')

        expect(shelter.over_capacity?).to be true

        shelter.adopt

        expect(shelter.over_capacity?).to be false
      end
    end

end
