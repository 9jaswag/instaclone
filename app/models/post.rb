class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :image
  after_create :notify_pusher

  validates :caption, presence: true
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, size: { in: 0..500.kilobytes }

  def serialised
    {
      id: self.id,
      caption: self.caption,
      user: self.user.username,
      image: self.image.url
    }
  end

  def notify_pusher
    Pusher.trigger('post', 'new', self.serialised)
  end
end
