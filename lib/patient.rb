class Patient
  attr_accessor(:id, :name, :birthdate, :doctor_id)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @doctor_id = attributes.fetch(:doctor_id).to_i
  end

  def self.all
    all_patients = DB.exec("SELECT * FROM patients;")
    patients_array = []
    all_patients.each() do |patient|
      id = patient.fetch("id").to_i()
      name = patient.fetch("name")
      birthdate = patient.fetch("birthdate")
      doctor_id = patient.fetch("doctor_id")
      patients_array.push(Patient.new({:id => id, :name => name, :birthdate => birthdate, :doctor_id => doctor_id}))
    end
    patients_array
  end

  def ==(another_patient)
    self.name().==(another_patient.name()).&(self.id().==(another_patient.id())).&(self.birthdate().==(another_patient.birthdate())).&(self.doctor_id().==(another_patient.doctor_id()))
  end

  def save
    saved_patient = DB.exec("INSERT INTO patients (name, birthdate, doctor_id) VALUES ('#{@name}', '#{@birthdate}', '#{@doctor_id}') RETURNING id;")
    @id = saved_patient.first().fetch("id").to_i()
  end

  def doctor(patient_id)
    my_doctor = ""
    poss_docs = Doctor.all()
    poss_docs.each |doctor| do
      if patient_id.even?
        my_doctor = doctor_id.first()
      else
        my_doctor = doctor_id.second()
    end
    my_doctor
  end

end #Patient class
