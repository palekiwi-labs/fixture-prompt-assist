require 'spec_helper'

RSpec.describe PromptAssist::TemplateProcessor do
  describe "#process" do
    it "replaces template variables" do
      processor = PromptAssist::TemplateProcessor.new(
        "Hello {{name}}, welcome to {{place}}!",
        { name: "Alice", place: "Wonderland" }
      )
      
      result = processor.process
      expect(result).to eq("Hello Alice, welcome to Wonderland!")
    end

    it "handles numeric variables" do
      processor = PromptAssist::TemplateProcessor.new(
        "You have {{count}} items",
        { count: 5 }
      )
      
      result = processor.process
      expect(result).to eq("You have 5 items")
    end

    it "raises error for unresolved variables" do
      processor = PromptAssist::TemplateProcessor.new(
        "Hello {{name}}, welcome to {{place}}!",
        { name: "Alice" }
      )
      
      expect { processor.process }.to raise_error(PromptAssist::Error, /Unresolved template variables: place/)
    end

    it "works with empty variables hash" do
      processor = PromptAssist::TemplateProcessor.new(
        "Hello world!",
        {}
      )
      
      result = processor.process
      expect(result).to eq("Hello world!")
    end

    it "raises error for nil template" do
      processor = PromptAssist::TemplateProcessor.new(nil, {})
      expect { processor.process }.to raise_error(PromptAssist::Error, "Template cannot be nil")
    end

    it "raises error for empty template" do
      processor = PromptAssist::TemplateProcessor.new("", {})
      expect { processor.process }.to raise_error(PromptAssist::Error, "Template cannot be empty")
    end

    it "raises error for malformed placeholders" do
      processor = PromptAssist::TemplateProcessor.new("Hello {name}!", {})
      expect { processor.process }.to raise_error(PromptAssist::Error, "Malformed template placeholders detected")
    end

    it "handles multiple occurrences of same variable" do
      processor = PromptAssist::TemplateProcessor.new(
        "{{greeting}} {{name}}, {{greeting}} again!",
        { greeting: "Hello", name: "World" }
      )
      
      result = processor.process
      expect(result).to eq("Hello World, Hello again!")
    end
  end
end
