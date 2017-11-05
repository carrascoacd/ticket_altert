require 'ticket_alert'

describe TicketAlert::Listener do

  before :each do
    @listener = TicketAlert::Listener.new
  end 

  it "check if has incoming date" do
    expected_date = 'madrid valencia 10/10/2017'
    allow(Mail).to receive(:find).and_return([Mail.new(body: expected_date)])
    expect(@listener.last_messages_received.size).to eql(1)
  end

end