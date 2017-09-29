require 'cryptid/version'
require 'cryptid/configuration'
require 'cryptid/client'
require 'cryptid/helpers'

module Cryptid
  class << self
    attr_writer :configuration, :client

    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      @configuration = Configuration.new
    end

    def configure
      yield(configuration)
    end

    def client
      @client ||= Client.new
    end

    def send(event)
      client.send(event)
    end
  end
end
