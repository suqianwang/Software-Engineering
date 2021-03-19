require 'rails_helper'

RSpec.describe MoviesController, :type => :controller do

  before do
    # Movie.create!(title: 'title 1', rating: 'R', release_date: '01-Jan-2019')
    # Movie.create!(title: 'title 2', rating: 'G', release_date: '01-Jan-2018', director: 'Jane Doe')
    # Movie.create!(title: 'title 3', rating: 'PG', release_date: '01-Jan-2017', director: 'Jane Doe')
    post :create, movie: {title: 'title 1', rating: 'R', release_date: '01-Jan-2019'}
    post :create, movie: {title: 'title 2', rating: 'G', release_date: '01-Jan-2018', director: 'Jane Doe'}
    post :create, movie: {title: 'title 3', rating: 'PG', release_date: '01-Jan-2017', director: 'Jane Doe'}
  end

  describe '#show' do
    it 'find movie' do
      @id = '1'
        get :show, :id => @id
        expect(response).to render_template('show')
    end
  end

  describe '#index' do
    it 'sort movies by title' do
      @rating = {R: 1, G: 1}
      get :index, {:sort => 'title', :ratings => @rating}
      get :index, {:sort => 'title', :ratings => @rating}
      expect(response).to render_template('index')
    end

    it 'sort movies by release date' do
      @rating = {R: 1, G: 1}
      get :index, {:sort => 'release_date', :ratings => @rating}
      get :index, {:sort => 'release_date', :ratings => @rating}
      expect(response).to render_template('index')
    end

    it 'sort movies without ratings filter' do
      @all_ratings = %w(G PG PG-13 NC-17 R)
      @rating = {}
      @rating = Hash[@all_ratings.map {|rating| [rating, rating]}]
      get :index, {:sort => 'title'}
      expect(response).to redirect_to(movies_path(:sort => 'title', :ratings => @rating))
    end
  end

  describe '#create' do
    it 'create new movie' do
      @movie = {title: 'Annabelle', rating: 'R', release_date: '03-Oct-2014', director: 'John Leonetti'}
      post :create, :movie => @movie
      expect(flash[:notice]).to eq("Annabelle was successfully created.")
      expect(response).to redirect_to(movies_path)
    end
  end

  describe '#edit' do
    it 'edit existing movie' do
      @id = '1'
      get :edit, :id => @id
      expect(response).to render_template('edit')
    end
  end

  describe '#update' do
    it 'update existing movie' do
      @id = '1'
      @movie = {title: 'Annabelle', rating: 'R', release_date: '03-Oct-2014', director: 'John Leonetti'}
      put :update, :id => @id, :movie => @movie
      expect(flash[:notice]).to eq("Annabelle was successfully updated.")
      expect(response).to redirect_to(movie_path(@id))
    end
  end

  describe '#destroy' do
    it 'delete existing movie' do
      @id = '1'
      @movie = Movie.find @id
      delete :destroy, :id => @id
      expect(flash[:notice]).to eq("Movie '#{@movie.title}' deleted.")
      expect(response).to redirect_to(movies_path)
    end
  end

  describe '#same_director' do
    context 'when a movie has no director' do
      it 'redirect to home page' do
        @id = '1'
        @movie = Movie.find @id
        get :same_director, :id => @id
        expect(flash[:notice]).to eq("'#{@movie.title}' has no director info")
        expect(response).to redirect_to(movies_path)
      end
    end
    context 'when a movie has director' do
      it 'find all movies with the same director' do
        @id = '2'
        get :same_director, :id => @id
        expect(response).to render_template('same_director')
      end
    end
  end
end