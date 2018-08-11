class Patient
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end

  def appointments
    Appointment.all.select do |appointment|
      if appointment.patient == self
        appointment
      end
    end
  end

  def doctors
    appointments.map do |appointment|
      appointment.doctor
    end
  end
end
