class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :image

  validates :caption, presence: true
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, size: { in: 0..500.kilobytes }
end
