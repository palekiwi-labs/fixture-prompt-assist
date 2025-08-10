# PromptAssist

A simple Ruby library for processing and validating text prompts.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prompt_assist'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install prompt_assist

## Usage

```ruby
require 'prompt_assist'

# Process text
result = PromptAssist.process("  hello   world  ")
puts result # => "hello world"

# Process templates with variables
result = PromptAssist.process_template(
  "Hello {{name}}, welcome to {{place}}!",
  { name: "Alice", place: "Wonderland" }
)
puts result # => "Hello Alice, welcome to Wonderland!"
```

## Features

- **Text Processing**: Formats and validates text input
- **Template Processing**: Replace template variables with actual values
- **Validation**: Ensures text meets basic requirements
- **Error Handling**: Clear error messages for validation failures

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake spec` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/palekiwi-labs/fixture-prompt-assist.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
