require 'rails_helper'

RSpec.describe Doctor do
  before :each do
    test_data
  end

  describe "relationships" do
    it {should belong_to :hospital}
    it {should have_many :patient_doctors}
    it {should have_many(:patients).through(:patient_doctors)}
  end

  describe "instance methods" do
    describe "#hospital_name" do
      it "displays the hospital name of that docotor" do
        expect(@dr1.hospital_name).to eq("Grey Hospital")
        expect(@dr2.hospital_name).to eq("MGHospital")
      end
    end
  end
end
