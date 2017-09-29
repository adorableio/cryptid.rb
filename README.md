# cryptid.rb

Ruby client for [Cryptid Analytics](https://cryptid.analytics.io)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cryptid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cryptid

## Configuration

Use the following code in `config/environments/deveolopment.rb` and others,
subbing in the appropriate `tracker_id` for each environment.

```ruby
Cryptid.configure do |config|
  config.tracker_id = "<insert-your-tracker-id-here>"
end
```

## Usage

Anyplace you'd like to traack an event to the analytics service, call
`Cryptid.send` and supply a hash of event data.

```ruby
Cryptid.send({
  event_category: 'authentication',
  event_action: 'signup'
  event_label: 'signup-method',
  event_value: 'facebook'
})
```

**Note** that unlike other client libraries for cryptid, the ruby client does
not automatically gather and fill-in browser data (as there is none).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/adorableio/cryptid.rb](https://github.com/adorableio/cryptid.rb). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cryptid project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/adorableio/cryptid.rb/blob/master/CODE_OF_CONDUCT.md).
