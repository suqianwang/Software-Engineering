require 'rails_helper'

RSpec.describe MoviesController, type => :controller do

  describe '#index' do

  end

  describe '#create' do
    it 'create new movie' do
      @movie = {title: 'Annabelle', rating: 'R', release_date: '03-Oct-2014', director: 'John Leonetti'}
      post :create, params: @movie
      expect(flash[:notice]).to eq("Annabelle was successfully created.")
      expect(response).to redirect_to(movies_path)
    end
  end

  describe '#update' do

  end

  describe '#destroy' do

  end

  describe '#same_director' do

  end
end