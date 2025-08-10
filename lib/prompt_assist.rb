require_relative 'prompt_assist/version'
require_relative 'prompt_assist/formatter'
require_relative 'prompt_assist/validator'
require_relative 'prompt_assist/template_processor'

module PromptAssist
  class Error < StandardError; end

  def self.process(text)
    formatted = Formatter.new(text).format
    Validator.new(formatted).validate!
    formatted
  end

  def self.process_template(template, variables = {})
    processed = TemplateProcessor.new(template, variables).process
    process(processed)
  end
end
