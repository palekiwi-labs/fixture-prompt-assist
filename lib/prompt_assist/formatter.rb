module PromptAssist
  class Formatter
    def initialize(text)
      @text = text
    end

    def format
      @text.strip.gsub(/\s+/, ' ')
    end

    private

    attr_reader :text
  end
end
