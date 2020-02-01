class Patient
  
  @@all = []  

  attr_reader :name
  attr_accessor :appointment, :doctor
 
  
  def initialize(name)
    @name = name
    @@all << self
  end  
  
  def new_appointment(date, doctor)
    Appointment.new(date, self, doctor)
  end
  
  def appointments
    Appointments.all.select do |appointment|
      appointment.patient == self
    end
  end  
  
  def doctors
    Appointments.all.map do |appointment|
      appointment.doctor
    end
  end

  def self.all
    @@all
  end
end  