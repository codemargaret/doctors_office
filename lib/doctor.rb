class Doctor
  attr_accessor(:id, :name, :specialty)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
  end

  def self.all
    all_doctors = DB.exec("SELECT * FROM doctors;")
    doctors_array = []
    all_doctors.each() do |doctor|
      id = doctor.fetch("id").to_i()
      name = doctor.fetch("name")
      specialty = doctor.fetch("specialty")
      doctors_array.push(Doctor.new({:id => id, :name => name, :specialty => specialty}))
    end
    doctors_array
  end

  def save

  end
end #Doctor class
