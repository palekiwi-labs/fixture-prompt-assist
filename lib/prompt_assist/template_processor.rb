module PromptAssist
  class TemplateProcessor
    def initialize(template, variables = {})
      @template = template
      @variables = variables
    end

    def process
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

    private

    attr_reader :template, :variables
  end
end
