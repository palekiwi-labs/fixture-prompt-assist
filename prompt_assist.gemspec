Gem::Specification.new do |spec|
  spec.name          = "prompt_assist"
  spec.version       = "0.1.0"
  spec.authors       = ["PaleKiwi Labs"]
  spec.email         = ["hello@palekiwi.com"]

  spec.summary       = "A simple prompt assistance library"
  spec.description   = "Provides utilities for managing and processing prompts"
  spec.homepage      = "https://github.com/palekiwi-labs/fixture-prompt-assist"
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*")
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.7.0"
end
