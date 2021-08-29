class CharactersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :create

  # GET /projects
  def index
    @characters = Character.all

    respond_to do |format|
      format.html # Es necesario el http header "Accept: text/html"
      format.json { @characters } # Es necesario el http header "Accept: application/json"
    end
  end

  def create
    # Rails asigna el campo :created_by automaticamente con el id del current_user
    @character = Character.create!(project_params)
    json_response(@character, :created)
  end

  def destroy
  end

  def project_params
    params.permit(:name, :age, :weight, :history, :image)
  end
end
