require 'ticket_alert/notifier_listener'

describe TicketAlert::NotifierListener do

  let(:notifier) { instance_double("TicketAlert::Notifier") }

  before :each do
    @listener = TicketAlert::NotifierListener.new(notifier)
  end

  it "sends an ok notification" do
    message = TicketAlert::Message.new " madrid valencia 10/12/2017"
    allow(notifier).to receive(:notify)
    @listener.on_new_messages [message]
    expect(notifier).to have_received(:notify)
  end

  it "send an error notification" do
    message = TicketAlert::Message.new "error!"
    allow(notifier).to receive(:notify)
    @listener.on_new_messages [message]
    expect(notifier).to have_received(:notify)
  end

  it "send an ok notification" do
    message = TicketAlert::Message.new " madrid valencia 10/12/2017"
    allow(notifier).to receive(:notify)
    @listener.on_ticket_found message
    expect(notifier).to have_received(:notify)
  end

end