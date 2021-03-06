require 'date'
require 'digest'

module TicketAlert

  class Message
    attr_accessor :date, :hour, :origin, :destination, :error, :text

    def initialize text=nil
      unless text.nil?
        m = text.match(/(?<origin>madrid|valencia).+(?<destination>madrid|valencia).+(?<date>\d{2}\/\d{2}\/\d{4}).?(?<hour>\d{2}\:\d{2})?/)
        begin
          self.date = Date.parse(m[:date]).strftime("%d/%m/%Y")
          self.origin = m[:origin].upcase
          self.destination = m[:destination].upcase
          self.hour = m[:hour]
        rescue ArgumentError, NoMethodError => e
          self.error = e
        ensure
          self.text = text
        end
      end
    end

    def identifier
      Digest::MD5.hexdigest("#{self.date}#{self.origin}#{self.destination}").to_sym
    end

    def to_h
      {date: self.date, origin: self.origin, destination: self.destination, hour: self.hour, error: self.error}
    end

  end

end