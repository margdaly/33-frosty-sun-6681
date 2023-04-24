require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it {should have_many :patient_doctors}
    it {should have_many(:doctors).through(:patient_doctors)}
  end

  describe "class methods" do
    before :each do
      test_data
    end

    describe "over_18yrs" do
      it "returns all patients over 18" do
        expect(Patient.over_18yrs.sort).to eq([@patient1, @patient2, @patient4])
      end
    end

    describe "viewable_pats" do
      it "returns all patients over 18 sorted by name in alphatical order" do
        expect(Patient.viewable_pats).to eq([@patient2, @patient1, @patient4])
      end
    end
  end
end
