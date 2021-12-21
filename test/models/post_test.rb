require "test_helper"

class PostTest < ActiveSupport::TestCase
  # creates a user in test database so that a post can be submitted
  def setup
    @new_user = User.create("username": "testname", "email": "example@example.com", "password": "123456")
  end

  # test if post without a title and body is invalid
  test "nil post" do
    nil_post = Post.new("user_id": @new_user.id)
    assert_not nil_post.valid?
  end

  # test if post w/ a title and body is valid
  test "valid post" do
    valid_post = Post.new("title": "Good Morning", "body": "Hello, World!", "user_id": @new_user.id)
    assert valid_post.valid?
  end

  # test if post w/o a title is not valid
  test "no title post" do
    no_title_post = Post.new("body": "Hello, World", "user_id": @new_user.id)
    assert_not no_title_post.valid?
  end

  # test if post w/o a body is not valid
  test "no body post" do
    no_body_post = Post.new("title": "Good Morning", "user_id": @new_user.id)
    assert_not no_body_post.valid?
  end
end
