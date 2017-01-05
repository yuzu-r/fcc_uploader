class Upload < ActiveRecord::Base
  validates :file, presence: true
  mount_uploader :file, FileUploader
end
