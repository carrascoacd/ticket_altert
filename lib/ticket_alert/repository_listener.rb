require 'ticket_alert/repository'

module TicketAlert

  class RepositoryListener

    def initialize(repository)
      @repository = repository || repository.new
    end

    def on_new_messages(message_list)
      @repository.read
      ok_messages = message_list.select{ |m| m.error.nil? }
      @repository.add ok_messages
      @repository.save
    end

    def on_ticket_found(message)
      @repository.delete message.identifier
    end
  end

end