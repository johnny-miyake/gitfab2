# encoding: utf-8

class FigureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small do
    process :resize_to_fit => [400, 400]
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallback/noimage_480x360.png")
  end
end
