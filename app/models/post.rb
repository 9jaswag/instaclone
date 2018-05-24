class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :image

  validates :caption, presence: true
  validates_attachment :image, presence: true
  do_not_validate_attachment_file_type :image
end
