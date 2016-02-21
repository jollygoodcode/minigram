class Gram < ActiveRecord::Base
  validates_presence_of :title, :content

  mount_uploader :image, ImageUploader
end
