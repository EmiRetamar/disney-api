class CharactersController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /characters
  def index
    @characters = Character.all

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
    # @character.save_movies
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

  def character_params
    params.permit(:name, :age, :weight, :history, :image, :movies)
  end
end
