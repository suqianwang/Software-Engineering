class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index

    @all_ratings = Movie.get_ratings

    # if box(es) has been checked, params[:ratings] will have a value of 1(default)
    if params[:ratings]
      # record the keys (the name of the boxes that has been checked) of the hash - ratings
      @check_ratings = params[:ratings].keys
    else
      @check_ratings = @all_ratings
    end

    # mark the checked box true
    @check_ratings.each do |rating|
      params[rating] = true
    end

    # ActiveRecord's QueryMethods - order: retrieve records from the database in ascending order by the field specified after ':'
    if params[:sort] == "title"
      @movies = Movie.order(:title)
    elsif params[:sort] == "release_date"
      @movies = Movie.order(:release_date)
    else
      @movies = Movie.where(:rating => @checked_ratings)
    end

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
