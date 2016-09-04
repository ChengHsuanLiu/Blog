module PostsHelper
  def post_if_public(post)
    if post.is_public
      content_tag :p, 'Public'
    else
      content_tag :p, 'Private'
    end
  end

  def prev_post_link(post_id)
    @post = Post.find(post_id)
    @prev_post = @post.prev_post
    if @prev_post.present?
      link_to "Previous - #{@prev_post.title}", post_path(@prev_post)
    end
  end

  def next_post_link(post_id)
    @post = Post.find(post_id)
    @next_post = @post.next_post
    if @next_post.present?
      link_to "Next - \n#{@prev_post.title}", post_path(@next_post)
    end
  end
end
