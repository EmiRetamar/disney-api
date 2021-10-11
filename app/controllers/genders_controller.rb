class GendersController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /genders
  def index
    @genders = Gender.all

    respond_to do |format|
      format.html # Es necesario el http header "Accept: text/html"
      format.json { @genders } # Es necesario el http header "Accept: application/json"
    end
  end

  def show
    @gender = Gender.find(params[:id])
    respond_to do |format|
      format.json { @gender } # Es necesario el http header "Accept: application/json"
    end
  end

  def create
    @gender = Gender.create!(gender_params)
    json_response(@gender, :created)
  end

  def update
    @gender = Gender.find(params[:id])
    @gender.update!(gender_params)
    json_response(@gender, :ok)
  end

  def destroy
    @gender = Gender.find(params[:id])
    @gender.destroy!
    json_response({"message" => "deleted"}, :ok)
  end

  private

  def gender_params
    params.permit(:name, :image)
  end
end
