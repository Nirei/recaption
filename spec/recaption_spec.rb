# frozen_string_literal: true

require "fileutils"
require "mini_magick"
require "recaption"

RSpec.describe Recaption do
  let(:test_image_file_path) { "assets/dubai.jpg" }
  let(:temp_path) { "/tmp/dubai.jpg" }
  let(:caption) do
    "The Edges Of Dubai, by Trey Ratcliff. A picture of the nocturnal landscape of Dubai. It depicts bright skyscrappers lighting up the night sky."
  end

  before { FileUtils.cp(test_image_file_path, temp_path) }
  after { File.delete(temp_path) }

  describe "round trip" do
    subject do
      captioned = described_class.write!(temp_path, caption)
      described_class.read!(temp_path)
    end

    it "the received caption is recovered successfully after a round trip" do
      expect(subject).to eq(caption)
    end
  end

  describe "::write" do
    let(:original) { MiniMagick::Image.open(test_image_file_path) }
    let(:captioned) { MiniMagick::Image.open(temp_path) }

    it "maintains original image dimensions" do
      described_class.write!(temp_path, caption)
      expect(captioned.dimensions).to eq(original.dimensions)
    end
  end

  describe "::clear" do
    subject do
      captioned = described_class.write!(temp_path, caption)
      captioned = described_class.clear!(temp_path)
      described_class.read!(temp_path)
    end

    it "the image has no caption" do
      expect(subject).to eq(nil)
    end
  end

  describe "::read" do
    subject { described_class.read!(temp_path) }

    it "the image has no caption" do
      expect(subject).to eq(nil)
    end
  end
end
