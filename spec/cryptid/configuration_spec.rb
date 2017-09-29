require 'spec_helper'

RSpec.describe Cryptid::Configuration do
  let(:configuration) { described_class.new }

  it 'defaults the url to the production url' do
    expect(configuration.url).to eq 'https://cryptid.adorable.io/api/events'
  end

  it 'may configure the cryptid service hostname' do
    configuration.hostname = 'http://foo.com'
    expect(configuration.url).to eq 'http://foo.com/api/events'
  end

  it 'may configure the cryptid event uri' do
    configuration.event_uri = '/api/eventaloo'
    expect(configuration.url).to eq 'https://cryptid.adorable.io/api/eventaloo'
  end
end
