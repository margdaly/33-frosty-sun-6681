class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors

  def hospital_name
    hospital.name
  end

  # def viewable_pats
  #   patients.where('patient.age >= ?', 18).order(name: :asc)
  # end

  def viewable_pats
    patients.over_18yrs.viewable
  end
end