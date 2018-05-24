class Like < ApplicationRecord
  after_save :notify_pusher, on: :create
  belongs_to :post

  def notify_pusher
    Pusher.trigger('post', 'new-like', self.post.serialised)
  end
end
