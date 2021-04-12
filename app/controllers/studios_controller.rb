class StudiosController < ApplicationController
  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
    @movies = @studio.movies
  end
  # <p>* <%= movie.title %></p>

end
