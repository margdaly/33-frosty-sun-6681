require "rails_helper"

RSpec.describe "Doctor's Show Page" do
  before :each do
    test_data
  end

  describe "When I visit a doctor's show page" do
    it "I see the doctor's name, specialty, and university" do
      visit doctor_path(@dr1)
      expect(page).to have_content("Meredith Grey")
      expect(page).to have_content("General Surgery")
      expect(page).to have_content("Harvard University")
      
      visit doctor_path(@dr2)
      expect(page).to have_content("Alex Karev")
      expect(page).to have_content("Pediatric Surgery")
      expect(page).to have_content("Johns Hopkins University")
    end

    it "I see the name of the hospital where this doctor works" do
      visit doctor_path(@dr1)
      expect(page).to have_content("Grey Hospital")

      visit doctor_path(@dr2)
      expect(page).to have_content("MGHospital")
    end

    it "I see the names of all their patients" do
      visit doctor_path(@dr1)
      within "#patients" do
        expect(page).to have_content("Katie Joe")
        expect(page).to have_content("George Michael")
        expect(page).to have_content("Wolf Blitz")
        expect(page).to_not have_content("Maybe Bluth")
      end

      visit doctor_path(@dr2)
      within "#patients" do
        expect(page).to have_content("Wolf Blitz")
        expect(page).to have_content("Maybe Bluth")
        expect(page).to_not have_content("Katie Joe")
        expect(page).to_not have_content("George Michael")
      end
    end
  end
end