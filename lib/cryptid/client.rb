require 'json'
require 'excon'

module Cryptid
  class Client
    attr_writer :conn, :tracker_id

    def initialize(options={})
      @conn = options[:conn] if options[:conn]

      if options[:tracker_id]
        @tracker_id = options[:tracker_id]
      else
        @tracker_id = Cryptid.configuration.tracker_id
      end
    end

    def url
      Cryptid.configuration.url
    end

    def conn
      @conn ||= ::Excon.new(url)
    end

    def tracker_id
      @tracker_id or raise 'Missing tracker_id. Set in initializer or Cryptid::Client constructor'
    end

    def headers
      {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
    end

    def send(event)
      conn.post(body: build_event_payload(event), headers: headers)
    end

    def build_event_payload(event)
      {
        event: Helpers.camelize(event.merge(tracker_id: tracker_id))
      }.to_json
    end
  end
end
