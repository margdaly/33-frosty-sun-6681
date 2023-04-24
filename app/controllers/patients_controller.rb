class PatientsController < ApplicationController
  def index
    @doctor = Doctor.find(params[:doctor_id])
    @pats = @doctor.viewable_pats
  end
end