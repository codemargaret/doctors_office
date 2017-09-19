require('patient')
require('doctor')
require('pry')
require('rspec')
require('pg')
require('spec_helper')

describe(Patient) do

  describe("#id") do
    it("tells you the id") do
      patient = Patient.new({:id => nil, :name => "Margaret Berry", :birthdate => "1985-07-17 20:00:00", :doctor_id => 1})
      expect(patient.id()).to(eq(nil))
    end
  end

  describe("#name") do
    it("tells you the name") do
      patient = Patient.new({:id => nil, :name => "Margaret Berry", :birthdate => "1985-07-17 20:00:00", :doctor_id => 1})
      expect(patient.name()).to(eq("Margaret Berry"))
    end
  end

  describe("#birthdate") do
    it("tells you the birthdate") do
      patient = Patient.new({:id => nil, :name => "Margaret Berry", :birthdate => "1985-07-17 20:00:00", :doctor_id => 1})
      expect(patient.birthdate()).to(eq("1985-07-17 20:00:00"))
    end
  end

  describe("#doctor_id") do
    it("tells you the doctor_id") do
      patient = Patient.new({:id => nil, :name => "Margaret Berry", :birthdate => "1985-07-17 20:00:00", :doctor_id => 1})
      expect(patient.doctor_id()).to(eq(1))
    end
  end

  describe(".all") do
    it("starts off with no patients") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("equates identical rows with different id's") do
      patient1 = Patient.new({:id => nil, :name => "Margaret Berry", :birthdate => "1985-07-17 20:00:00", :doctor_id => 1})
      patient2 = Patient.new({:id => nil, :name => "Margaret Berry", :birthdate => "1985-07-17 20:00:00", :doctor_id => 1})
      expect(patient1).to(eq(patient2))
    end
  end

  describe("#save") do
    it("saves a patient to the patients database") do
      new_patient = Patient.new({:id => nil, :name => "Margaret Berry", :birthdate => "1985-07-17 20:00:00", :doctor_id => 1})
      new_patient.save
      expect(Patient.all()).to(eq([new_patient]))
    end
  end

  describe("#doctor") do
    it("shows the patient's assigned doctor") do
      new_doctor = Doctor.new({:id => 1, :name => "Michael S. Booker", :specialty => "Internal Medicine"})
      # new_doctor2 = Doctor.new({:id => 2, :name => "Yasmine Capybara", :specialty => "Pediatrician"})
      new_patient = Patient.new({:id => nil, :name => "Margaret Berry", :birthdate => "1985-07-17 20:00:00", :doctor_id => 1})
      expect(new_patient.doctor).to(eq(new_doctor.id))
    end
  end

end #Patient class tests
