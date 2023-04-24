class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors

  def self.over_18yrs
    Patient.where('age >= ?', 18)
  end

  def self.viewable
    Patient.order(:name)
  end
end