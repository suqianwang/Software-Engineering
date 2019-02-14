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

    # if there is previous session saved but the URL lack of params, fill in the saved params
    if (params[:ratings].nil? && !(session[:ratings].nil?)) || (params[:sort].nil? && !(session[:sort].nil?))
      flash.keep
      redirect_to movies_path(:ratings => session[:ratings], :sort => session[:sort])
    end

    # if box(es) has been checked, params[:ratings] will not be empty, user choose filters
    if !(params[:ratings].nil?)
      # record the keys (the name of the boxes that has been checked) of the hash - ratings
      check_ratings = params[:ratings]
      # remember current session
      session[:ratings] = check_ratings

    # if user is not currently choosing filters, and there is previous session saved, use the memory
    # don't need to remember current session because current session didn't change
    elsif !(session[:ratings].nil?)
      check_ratings = session[:ratings]

    # initial
    elsif session[:ratings].nil?
      check_ratings = Hash[@all_ratings.collect {|item| [item, 1]}]
      # remember current session
      session[:ratings] = check_ratings
    end

    # mark the checked box true
    keys = session[:ratings].keys
    keys.each do |rating|
      params[rating] = true
    end

    @movies = Movie.where(:rating => check_ratings.keys)

    # if user is currently sorting, remember the sort field and current session
    if !(params[:sort].nil?)
      sort_field = params[:sort]
      session[:sort] = sort_field

    # if user is not sorting, apply previous sort session
    else
      sort_field = session[:sort]
    end

    # sort based on title or release_date
    if sort_field == "title"
      @movies = @movies.order(:title)
    elsif sort_field == "release_date"
      @movies = @movies.order(:release_date)
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