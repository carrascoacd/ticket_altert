require 'ticket_alert'

describe TicketAlert::MailReader do

  before :each do
    @mail_reader = TicketAlert::MailReader.new(:test)
  end 

  it "check if has incoming date" do
    expected_date = 'madrid valencia 10/10/2017'
    allow(Mail).to receive(:find).and_return([Mail.new(body: expected_date)])
    expect(@mail_reader.last_messages_received.size).to eql(1)
  end

end