module TicketMaster::Provider
  module Kanbanpad
    # Ticket class for ticketmaster-kanbanpad
    #
    class Ticket < TicketMaster::Provider::Base::Ticket
      API = KanbanpadAPI::Task
      attr_accessor :prefix_options
      # declare needed overloaded methods here
    end
  end
end
