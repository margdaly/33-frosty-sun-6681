PatientDoctor.destroy_all
Patient.destroy_all
Doctor.destroy_all
Hospital.destroy_all

  @hospital1 = Hospital.create!(name: "Grey Hospital")
  @hospital2 = Hospital.create!(name: "MGHospital")

  @dr1 = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
  @dr2 = @hospital2.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")

  @patient1 = Patient.create!(name: "Katie Joe", age: 24)
  @patient2 = Patient.create!(name: "George Michael", age: 56)
  @patient3 = Patient.create!(name: "Wolf Blitz", age: 17)
  @patient4 = Patient.create!(name: "Maybe Bluth", age: 20)

  PatientDoctor.create!(patient_id: @patient1.id, doctor_id: @dr1.id)
  PatientDoctor.create!(patient_id: @patient2.id, doctor_id: @dr1.id)
  PatientDoctor.create!(patient_id: @patient3.id, doctor_id: @dr1.id)

  PatientDoctor.create!(patient_id: @patient3.id, doctor_id: @dr2.id)
  PatientDoctor.create!(patient_id: @patient4.id, doctor_id: @dr2.id)
