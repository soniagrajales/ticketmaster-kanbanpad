module TicketMaster::Provider
  module Kanbanpad
    # Ticket class for ticketmaster-kanbanpad
    #
    class Ticket < TicketMaster::Provider::Base::Ticket
      attr_accessor :prefix_options
      # declare needed overloaded methods here
      API = KanbanpadAPI::Task

#      def slug
#        self.prefix_options[:project_slug]
#      end

    end
  end
end
