# frozen_string_literal: true

require "mini_exiftool"

module Recaption
  def self.read!(path)
    image = MiniExiftool.new(path)
    image.caption
  end

  def self.write!(path, caption)
    image = MiniExiftool.new(path)
    image.caption = caption
    image.save
  end

  def self.clear!(path)
    image = MiniExiftool.new(path)
    image.caption = nil
    image.save
  end
end
