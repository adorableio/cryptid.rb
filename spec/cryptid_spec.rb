require "spec_helper"

RSpec.describe Cryptid do
  after { Cryptid.reset }

  it "has a version number" do
    expect(Cryptid::VERSION).not_to be nil
  end
end
