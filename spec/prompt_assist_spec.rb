require 'spec_helper'

RSpec.describe PromptAssist do
  it "has a version number" do
    expect(PromptAssist::VERSION).not_to be nil
  end

  describe ".process" do
    it "processes text successfully" do
      result = PromptAssist.process("  hello   world  ")
      expect(result).to eq("hello world")
    end

    it "raises error for empty text" do
      expect { PromptAssist.process("") }.to raise_error(PromptAssist::Error)
    end
  end

  describe ".process_template" do
    it "processes template with variables" do
      result = PromptAssist.process_template(
        "  Hello {{name}}!  ",
        { name: "World" }
      )
      expect(result).to eq("Hello World!")
    end

    it "raises error for unresolved variables" do
      expect {
        PromptAssist.process_template("Hello {{missing}}!", {})
      }.to raise_error(PromptAssist::Error)
    end
  end
end
