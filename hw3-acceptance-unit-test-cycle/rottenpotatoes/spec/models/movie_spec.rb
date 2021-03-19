require 'rails_helper'

RSpec.describe Movie, type: :model do
  before do
    @movie1 = Movie.create!(title: 'movie1', director: 'Jane')
    @movie2 = Movie.create!(title: 'movie2', director: 'Jane')
    @movie3 = Movie.create!(title: 'movie1', director: 'John')
  end
  describe Movie do
    describe '.same_director_movies' do
      it 'find movies with the same director' do
        expect(@movie1.same_director_movies).to include(@movie2)
      end

      it 'find no movies with different director' do
        expect(@movie1.same_director_movies).not_to include(@movie3)
      end
    end
  end
end
