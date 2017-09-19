require('doctor')
require('pry')
require('rspec')
require('pg')
require('spec_helper')

describe(Doctor) do
  describe("#id") do
    it("tells you the id") do
      doctor = Doctor.new({:id => nil, :name => "Michael S. Booker", :specialty => "Internal Medicine"})
      expect(doctor.id()).to(eq(nil))
    end
  end

  describe("#name") do
    it("tells you the name") do
      doctor = Doctor.new({:id => nil, :name => "Michael S. Booker", :specialty => "Internal Medicine"})
      expect(doctor.name()).to(eq("Michael S. Booker"))
    end
  end

  describe("#specialty") do
    it("tells you the specialty") do
      doctor = Doctor.new({:id => nil, :name => "Michael S. Booker", :specialty => "Internal Medicine"})
      expect(doctor.specialty()).to(eq("Internal Medicine"))
    end
  end

  describe(".all") do
    it("starts off with no doctors") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("equates identical rows with different id's") do
      doctor1 = Doctor.new({:id => nil, :name => "Michael S. Booker", :specialty => "Internal Medicine"})
      doctor2 = Doctor.new({:id => nil, :name => "Michael S. Booker", :specialty => "Internal Medicine"})
      expect(doctor1).to(eq(doctor2))
    end
  end

  describe("#save") do
    it("saves a doctor to the doctors database") do
      new_doctor = Doctor.new({:id => nil, :name => "Michael S. Booker", :specialty => "Internal Medicine"})
      new_doctor.save
      expect(Doctor.all()).to(eq([new_doctor]))
    end
  end

end #Doctor class tests
