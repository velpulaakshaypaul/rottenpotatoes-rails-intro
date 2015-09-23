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
setup= Movie.set_options(params,session)
if setup[:redirect]
flash.keep
redirect_to(
:action => params[:action], :controller => params[:controller], 
:ratings => setup[:ratings], :sort_by => setup[:sort_by])
end
begin
@movies=Movie.movies(setup[:ratings], setup[:sort_by])
rescue
@movies=Movie.all
end
@ratings=Movie.ratings

session[:ratings]=setup[:ratings]
session[:sort_by]=setup[:sort_by]

#all_ratings=Movie.all_ratings
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
