# Pry Visualizer

Visualize Pry results in your browser as commands are executed in a Pry console.

## Usage

Default behavior it to auto detect result type and render as a single value,
JSON object or tabular grid view.


## Design

### Pry Hooks
+ `when_started` starts a Puma server with Tubesock.
+ `before_eval` captures initial command input.
+ `after_eval` sets command results and sends data to socket as JSON.

### Websocket Messages

+ command
  + id (numeric) :: sequential index of command executed in Pry
  + code (string) :: code evaluated
  + start (date time) :: when evaluation started
  + end (date time) :: when code finished
  + result (JSON) :: JSON results of evaluated code

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pry-visualizer'
```

And then execute:

    $ bundle

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ddrscott/pry-visualizer.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

