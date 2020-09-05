class Doctor
    
    attr_accessor :name, :patients, :appointments

    @@all = []

    def initialize(name)
        @name = name
        @patients = patients
        @appointments = appointments
        @@all << self
    end

    def self.all 
        @@all 
    end

    def appointments
        Appointment.all.select { |appt| appt.doctor == self }
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def patients
        appointments.collect do |appt|
            appt.patient
        end
    end

end