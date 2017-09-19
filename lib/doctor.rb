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

  def ==(another_doctor)
    self.name().==(another_doctor.name()).&(self.id().==(another_doctor.id())).&(self.specialty().==(another_doctor.specialty()))
  end

  def save
    saved_doctor = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = saved_doctor.first().fetch("id").to_i()
  end

  # def patients(id)
  #   my_patients = []
  #   all_patients = Patient.all()
  #   all_patients.each() do |patient|
  #     if patient.id = id
  #       my_patients.push(patient)
  #     end
  #   end
  #   my_patients
  # end

end #Doctor class
