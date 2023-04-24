require "rails_helper"

RSpec.describe "Patients Index Page" do
  before :each do
    test_data
  end

  describe "When I visit the patients index page" do
    it "I see the names of all adult patients (age is greater than 18)" do
      visit doctor_patients_path(@dr1)
      expect(page).to have_content("Katie Joe")
      expect(page).to have_content("George Michael")
      expect(page).to_not have_content("Wolf Blitz")

      visit doctor_patients_path(@dr2)
      expect(page).to have_content("Maybe Bluth")
      expect(page).to_not have_content("Wolf Blitz")
    end

    it "I see the names are in ascending alphabetical order" do
      PatientDoctor.create!(patient_id: @patient4.id, doctor_id: @dr1.id)
      visit doctor_patients_path(@dr1)

      within "#viewable_patients" do
        expect("George Michael").to appear_before("Katie Joe") 
        expect("Katie Joe").to appear_before("Maybe Bluth") 
        expect("Maybe Bluth").to_not appear_before("George Michael")
      end
    end
  end
end