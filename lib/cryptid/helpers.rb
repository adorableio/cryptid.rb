require 'kamelcase'

module Cryptid
  class Helpers
    def self.camelize(hash)
      hash.reduce({}) do |h, (k, v)|
        if v.is_a? Hash
          h.merge({k.to_s.camel_lower.to_sym => camelize(v)})
        else
          h.merge({k.to_s.camel_lower.to_sym => v})
        end
      end
    end
  end
end
