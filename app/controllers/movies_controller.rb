class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie.destroy
    redirect_to movies_path, status: see_other
  end

  def update
    @movie.update(movie_params)

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
