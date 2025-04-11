modules Api
  modules V1
   class DriversController < ApplicationController
     # all drivers
     def index
       drivers = Driver.all
       render json: drivers
     end
  end

  def show
    render json: @driver
  end

  def create
    driver = Driver.new(driver_params)
    if driver.save
      render json: driver, status: :created
    else
      render json: driver.errors, status: :unprocessable_entity
    end
  end

  def update
    if @driver.update(driver_params)
      render json: @driver
    else
      render json: @driver.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @driver.destroy
    head :no_content
  end

  private

  def set_driver
    @driver = driver.find_by(id: params[:id])
    unless @driver
      render json: { error: 'driver not found' }, status: :not_found
    end
  end

  def driver_params
    params.require(:driver).permit(:full_name, :email, :phone, :truck_type, :truck_data)
  end

end
