module PromptAssist
  class TemplateProcessor
    def initialize(template, variables = {})
      @template = template
      @variables = variables
    end

    def process
      validate_template!
      
      result = template
      variables.each do |key, value|
        placeholder = "{{#{key}}}"
        result = result.gsub(placeholder, value.to_s)
      end
      
      # Check for unresolved placeholders
      if result.match?(/\{\{[^}]+\}\}/)
        unresolved = result.scan(/\{\{([^}]+)\}\}/).flatten
        raise Error, "Unresolved template variables: #{unresolved.join(', ')}"
      end
      
      result
    end

    def validate_template!
      raise Error, "Template cannot be nil" if template.nil?
      raise Error, "Template cannot be empty" if template.empty?
      
      # Check for malformed placeholders
      if template.match?(/\{[^{]|[^}]\}/)
        raise Error, "Malformed template placeholders detected"
      end
    end

    private

    attr_reader :template, :variables
  end
end
