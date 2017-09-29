require 'spec_helper'
require 'excon'

RSpec.describe Cryptid::Client do
  let(:tracker_id) { 'web|abc123' }
  let(:url) { Cryptid::Configuration.new.url }
  let(:excon) { Excon.new(url, mock: true) }
  let(:client) { described_class.new(conn: excon, tracker_id: tracker_id) }

  describe '#url' do
    it 'defaults to the production url' do
      expect(client.url).to eq 'https://cryptid.adorable.io/api/events'
    end
  end

  describe '#send' do
    let(:expected_body) do
      {
        event: {
          eventValue: 'login-successful',
          trackerId: tracker_id,
        }
      }.to_json
    end

    it 'sends the event in an envelope in the body' do
      expect(excon).to receive(:post).with(a_hash_including({body: expected_body}))
      client.send({event_value: 'login-successful'})
    end
  end
end
