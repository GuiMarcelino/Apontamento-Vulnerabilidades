class VulnerablesController < ApplicationController

  # GET /vulnerables
  def index
    @vulnerables = Vulnerable.all

    render json: @vulnerables
  end

  # GET /vulnerables/1
  def show
    render json: @vulnerable
  end

  # POST /vulnerables
  def create
    @vulnerable = Vulnerable.new(vulnerable_params)

    if @vulnerable.save
      render json: @vulnerable, status: :created, location: @vulnerable
    else
      render json: @vulnerable.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vulnerables/1
  def update
    if @vulnerable.update(vulnerable_params)
      render json: @vulnerable
    else
      render json: @vulnerable.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vulnerables/1
  def destroy
    @vulnerable.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vulnerable
    @vulnerable = Vulnerable.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def vulnerable_params
    params.require(:vulnerable).permit(
      :nome,
      :description,
      :level,
      :status,
      :solution
    )
  end
end