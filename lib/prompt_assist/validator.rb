module PromptAssist
  class Validator
    def initialize(text)
      @text = text
    end

    def validate!
      raise Error, "Text cannot be empty" if text.empty?
      raise Error, "Text too long" if text.length > 1000
      true
    end

    private

    attr_reader :text
  end
end
