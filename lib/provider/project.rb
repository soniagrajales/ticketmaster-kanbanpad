module TicketMaster::Provider
  module Kanbanpad
    # Project class for ticketmaster-kanbanpad
    # 
    # 
    class Project < TicketMaster::Provider::Base::Project
      # declare needed overloaded methods here
	    API = KanbanpadAPI::Project
	  
	    attr_accessor :prefix_options
	    alias_method :tasks, :tickets
      alias_method :task, :ticket

    # este metodo ya existe en kanbanpad-api pero parece que el spec no me lo tomaba entonces me toco adicionarlo aqui
      def tickets(options = {})
        KanbanpadAPI::Task.find(:all, :params => options.update(:slug => slug))
      end
	
	    def initialize(*options)
        super(*options)
        self.id = self.id.to_i
      end

      # copy from this.copy(that) copies that into this
      def copy(project)
        project.tickets.each do |ticket|
          copy_ticket = self.ticket!(:title => ticket.title, :description => ticket.description)
          ticket.comments.each do |comment|
            copy_ticket.comment!(:body => comment.body)
            sleep 1
          end
        end
      end

    end
  end
end
