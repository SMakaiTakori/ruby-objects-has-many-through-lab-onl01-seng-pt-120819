class Patient
  
  @@all = []  

  attr_accessor :name, :appointment, :doctor
 
  
  def initialize(name)
    @name = name
    @@all << self
  end  
  
  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end
  
  def appointments
    Appointments.all.select do |appointment|
      appointment.patient == self
    end
  end  
  
  def doctors
    appointments.map do |appointment|
      appointment.doctor
    end
  end

  def self.all
    @@all
  end
end  