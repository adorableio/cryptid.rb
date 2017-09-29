require 'spec_helper'

RSpec.describe Cryptid::Helpers do
  describe '#camelize' do
    let(:single) do
      { my_name: 'zach', my_title: 'cool gai' }
    end

    it 'maps snake_case keys to camelCase keys' do
      expect(described_class.camelize(single)).to match({
        myName: 'zach',
        myTitle: 'cool gai'
      })
    end

    let(:nested) do
      {
        profile_spec: {
          first_name: 'zachery',
          last_name: 'moneypenny'
        }
      }
    end

    it 'maps snake_case keys to camelCase in a nested hash' do
      expect(described_class.camelize(nested)).to match({
        profileSpec: {
          firstName: 'zachery',
          lastName: 'moneypenny'
        }
      })
    end
  end
end
