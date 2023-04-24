class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
    @pats = @doctor.patients
  end
end