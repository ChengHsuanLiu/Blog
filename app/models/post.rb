class Post < ApplicationRecord
  belongs_to :category
  scope :public_posts, -> { where('is_public = ?', true) }
  scope :exist_posts, -> { where(deleted_at: nil) }

  def destroy
    self.deleted_at = Time.now if self.deleted_at.nil?
    self.save!
  end

  def next_post
    @next_post = Post.where("id > ?", self.id).first
  end

  def prev_post
    @prev_post = Post.where("id < ?", self.id).first
  end

  def self.available_posts
    public_posts.exist_posts
  end
end
