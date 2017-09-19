require('patient')
require('pry')
require('rspec')
require('pg')
require('spec_helper')

describe(Patient) do
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

end #Patient class tests
