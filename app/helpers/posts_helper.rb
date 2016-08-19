module PostsHelper
  def post_if_public(post)
    if post.is_public
      content_tag :p, 'Public'
    else
      content_tag :p, 'Private'
    end
  end
end
