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
      within "#patient-#{@patient1.id}" do
        expect(page).to have_content("Katie Joe")
        expect(page).to_not have_content("George Michael")
        expect(page).to_not have_content("Wolf Blitz")
        expect(page).to_not have_content("Maybe Bluth")
      end
      within "#patient-#{@patient2.id}" do
        expect(page).to have_content("George Michael")
        expect(page).to_not have_content("Katie Joe")
        expect(page).to_not have_content("Wolf Blitz")
        expect(page).to_not have_content("Maybe Bluth")
      end
      within "#patient-#{@patient3.id}" do
        expect(page).to have_content("Wolf Blitz")
        expect(page).to_not have_content("Katie Joe")
        expect(page).to_not have_content("George Michael")
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

  describe "Remove Patient from a Doctor" do
    it "has button next to each patient's name to remove from caseload" do
      visit doctor_path(@dr1)

      within "#patient-#{@patient1.id}" do
        expect(page).to have_button("Remove")
      end
      within "#patient-#{@patient2.id}" do
        expect(page).to have_button("Remove")
      end
      within "#patient-#{@patient3.id}" do
        expect(page).to have_button("Remove")
      end
    end

    it "click button to delete patient from only that dr and redirect back to that dr's show page" do
      visit doctor_path(@dr1)
      within "#patient-#{@patient3.id}" do
        click_on("Remove")
        # @patient3.reload
      end
      expect(current_path).to eq(doctor_path(@dr1))
      expect(page).to_not have_content("Wolf Blitz")
      visit doctor_path(@dr2)
      expect(page).to have_content("Wolf Blitz")
    end
  end
end