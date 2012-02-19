class User < ActiveRecord::Base
  has_attached_file :avatar,
  :styles => {
    :thumb => "75x75>",
    :small => "150x150>"
  },
  :storage => :s3,
  :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
  :path => "/:style/:filename"
  
  validates_attachment_size :avatar, :less_than => 1.megabyte
end
