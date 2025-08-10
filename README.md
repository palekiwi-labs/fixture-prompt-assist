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

# Template processing also applies text formatting
result = PromptAssist.process_template(
  "   {{greeting}}    {{target}}   ",
  { greeting: "Hello", target: "Ruby" }
)
puts result # => "Hello Ruby"

# Handle multiple occurrences of same variable
result = PromptAssist.process_template(
  "{{greeting}} {{name}}, {{greeting}} again!",
  { greeting: "Hello", name: "World" }
)
puts result # => "Hello World, Hello again!"
```

## Features

- **Text Processing**: Formats and validates text input by normalizing whitespace
- **Template Processing**: Replace template variables with actual values using `{{variable}}` syntax
- **Robust Validation**: Ensures text meets basic requirements and templates are well-formed
- **Error Handling**: Clear error messages for validation failures and unresolved variables
- **Safety Checks**: Detects malformed placeholders and prevents empty/nil templates

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake spec` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/palekiwi-labs/fixture-prompt-assist.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
