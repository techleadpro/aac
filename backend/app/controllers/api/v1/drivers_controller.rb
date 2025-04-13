module Api
  module V1
   class DriversController < ApplicationController
     ALLOWED_DATA = %[full_name email phone truck_type truck_data].freeze
     ## added changes
     # all drivers
     def index
       drivers = Driver.all
       render json: drivers
     end

  def show
    driver = Driver.find(params[:id])
    render json: driver
  end

  def create
    data = json_payload.select{|k| ALLOWED_DATA.include?(k)}
    driver = Driver.new(data)
    if driver.save
      render json: driver, status: :created
    else
      render json: driver.errors, status: :unprocessable_entity
    end
  end

  def update
    data = json_payload.select{|k| ALLOWED_DATA.include?(k)}
    driver = Driver.find(params[:id])
    if driver.update(data)
      render json: driver
    else
      render json: driver.errors, status: :unprocessable_entity
    end
  end

  def destroy
    driver = Driver.find(params[:id])
  #  @driver.destroy
    driver.destroy
    head :no_content
  end

#  private

#  def set_driver
#    @driver = driver.find_by(id: params[:id])
#    unless @driver
#      render json: { error: 'driver not found' }, status: :not_found
#    end
#  end

#  def driver_params
#    params.require(:driver).permit(:full_name, :email, :phone, :truck_type, :truck_data)
#  end

end
end
end
