require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Ticketmaster::Provider::Kanbanpad::Ticket" do
  before(:all) do
    headers = {}
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get '/api/v1/projects/be74b643b64e3dc79aa0.xml', headers, fixture_for('projects/be74b643b64e3dc79aa0'), 200
      mock.get '/api/v1/projects/be74b643b64e3dc79aa0/tasks.xml', headers, fixture_for('tasks'), 200
      mock.get '/api/v1/projects/be74b643b64e3dc79aa0/tasks/4cd428c496f0734eef000007.xml', headers, fixture_for('tasks/4cd428c496f0734eef000007'), 200
    end
    @project_slug = 'be74b643b64e3dc79aa0'
    @ticket_id = '4cd428c496f0734eef000007'
  end

  before(:each) do
    @ticketmaster = TicketMaster.new(:kanbanpad, {})
    @project = @ticketmaster.project(@project_slug)
    @klass = TicketMaster::Provider::Kanbanpad::Ticket
  end

  it "should be able to load all tickets" do
    @project.tickets.should be_an_instance_of(Array)
    @project.tickets.first.should be_an_instance_of(@klass)
  end
end
