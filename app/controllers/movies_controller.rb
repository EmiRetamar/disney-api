class MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /movies
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html # Es necesario el http header "Accept: text/html"
      format.json { @movies } # Es necesario el http header "Accept: application/json"
    end
  end

  def show
    @movie = Movie.find(params[:id])
    respond_to do |format|
      format.json { @movie } # Es necesario el http header "Accept: application/json"
    end
  end

  def create
    set_gender
    @movie = @gender.movies.create!(movie_params)
    @movie.save_characters(params[:characters])
    # @movie.save_characters
    json_response(@movie, :created)
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update!(movie_params)
    json_response(@movie, :ok)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy!
    json_response({"message" => "deleted"}, :ok)
  end

  def set_gender
    @gender = Gender.find(params[:gender_id])
  end

  def movie_params
    params.permit(:title, :creation_date, :rating, :image)
  end
end
