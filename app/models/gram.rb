class Gram < ActiveRecord::Base
  validates_presence_of :title, :content
end
