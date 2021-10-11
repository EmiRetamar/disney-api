class CharactersController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /characters
  def index
    query_params = request.query_parameters

    if query_params.empty?
      @characters = Character.all
    else
      @characters = Character.filter_characters_by_characteristics(query_params)
    end

    # characters_filtered_by_movie = []

    if query_params[:movie_id]
      characters_filtered_by_movie = Character.filter_characters_by_movie(@characters, query_params[:movie_id].to_i)
      @characters = characters_filtered_by_movie
    end

    respond_to do |format|
      format.html # Es necesario el http header "Accept: text/html"
      format.json { @characters } # Es necesario el http header "Accept: application/json"
    end
  end

  def show
    @character = Character.find(params[:id])
    respond_to do |format|
      format.json { @character } # Es necesario el http header "Accept: application/json"
    end
  end

  def create
    @character = Character.create!(character_params)
    @character.save_movies(params[:movies])
    json_response(@character, :created)
  end

  def update
    @character = Character.find(params[:id])
    @character.update!(character_params)
    json_response(@character, :ok)
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy!
    json_response({"message" => "deleted"}, :ok)
  end

  private

  def character_params
    params.permit(:name, :age, :weight, :history, :image, :movies)
  end
end
