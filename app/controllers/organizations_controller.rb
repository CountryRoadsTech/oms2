# frozen_string_literal: true

# This controller defines all actions available to Organizations
class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations or /organizations.json
  def index
    @organizations = authorize Organization.all
  end

  # GET /organizations/1 or /organizations/1.json
  def show
    authorize @organization

    # Redirect to the latest URL for the organization if an old slug was used
    redirect_to @organization, status: :moved_permanently if request.path != organization_path(@organization)
  end

  # GET /organizations/new
  def new
    @organization = authorize Organization.new
  end

  # GET /organizations/1/edit
  def edit
    authorize @organization
  end

  # POST /organizations or /organizations.json
  def create
    @organization = authorize Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to organization_url(@organization), notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1 or /organizations/1.json
  def update
    authorize @organization

    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to organization_url(@organization), notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1 or /organizations/1.json
  def destroy
    authorize @organization
    @organization.archive!

    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = Organization.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # Render the 404 page if the record cannot be found with the given slug
    render file: Rails.public_path.join('404.html'), status: :not_found and return
  end

  # Only allow a list of trusted parameters through.
  def organization_params
    params.require(:organization).permit(:name, :description, :logo, :domain, :subdomain, :social_media_urls)
  end
end
