
class HistoricsController < ApplicationController

  # GET /historics
  def index
   @historics = Historic.all

    render json:@historics
  end

  # GET /historics/1
  def show
    render json:@historic
  end

  # POST /historics
  def create
   @historic = Historic.new(historic_params)

    if@historic.save
      render json:@historic, status: :created, location:@historic
    else
      render json:@historic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /historics/1
  def update
    if@historic.update(historic_params)
      render json:@historic
    else
      render json:@historic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /historics/1
  def destroy
   @historic.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_historic
   @historic = Historic.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def historic_params
    params.require(:historic).permit(
    )
  end
end