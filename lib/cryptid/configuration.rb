require 'uri'

module Cryptid
  class Configuration
    attr_writer :event_uri, :hostname
    attr_accessor :tracker_id

    def event_uri
      @event_uri ||= '/api/events'
    end

    def hostname
      @hostname ||= 'https://cryptid.adorable.io'
    end

    def url
      URI.join(hostname, event_uri).to_s
    end
  end
end
