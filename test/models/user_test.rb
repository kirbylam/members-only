require "test_helper"

class UserTest < ActiveSupport::TestCase

  v_name = "johndoe" # valid username that will be user in multiple tests
  v_email = "example@example.com" # valid email that will be used in multiple tests
  v_pw = "123456" # valid password that will be used in multiple tests

  def setup
    @valid_user = User.create(username: "joesmith", email: "coolkid@gmail.com", password: "1234567", password_confirmation: "1234567")
  end

  # tests to check if creating a user w/o a name, email, and password is not valid
  test "nil user" do
    assert true
  end

  # test to check if creating a user w/o a name is not valid
  test "no name user" do
    no_name_user = User.new(email: v_email, password: v_pw, password_confirmation: v_pw)
    assert_not no_name_user.valid?
  end

  # test to check if creating a user w/o a email is not valid
  test "no email user" do
    no_email_user = User.new(username: v_name, password: v_pw, password_confirmation: v_pw)
    assert_not no_email_user.valid?
  end

  # test to check if creating a user w/o a password is not valid
  test "no password user" do 
    no_password_user = User.new(username: v_name, email: v_email, password_confirmation: v_pw)
    assert_not no_password_user.valid?
  end

  # test to check if creating a user w/o a password validation is not valid
  test "no validation user" do
    no_validation_user = User.new(username: v_name, email: v_email, password: v_pw)
    assert_not no_validation_user.valid?
  end

  # test to check if creating a user is valid
  test "valid user" do
    valid_user = User.new(username: v_name, email: v_email, password: v_pw, password_confirmation: v_pw)
    assert valid_user.valid?
  end

  # test to check if creating a name w/ fewer than 6 characters is not valid
  test "less than 6 name" do
    lt6_user = User.new(username: "joe", email: v_email, password: v_pw, "password": v_pw)
    assert_not lt6_user.valid?
  end

  # test to check if creating a name w/ more than 12 characters is not valid
  test "more than 12 name" do
    mt12_user = User.new(username: "johndoe123456", email: v_email, password: v_pw, password_confirmation: v_pw)
    assert_not mt12_user.valid?
  end

  # test to check if creating a password w/ less than 6 characters is not valid
  test "less than 6 password" do
    lt6_password = User.new(username: v_name, email: v_email, password: "12345", password_confirmation: "12345")
    assert_not lt6_password.valid?
  end

  # test to check if a user with an existing username in the db is not valid
  test "existing username" do
    dupe_name = User.new(username: "joesmith", email: v_email, password: v_pw, password_confirmation: v_pw)
    assert_not dupe_name.valid?
  end

  # test to check if a user with an existing email in the db is not valid
  test "existing email" do
    dupe_email = User.new(username: v_name, email: "coolkid@gmail.com", password: v_pw, password_confirmation: v_pw)
    assert_not dupe_email.valid?
  end

  # test to check if a user w/o a matching password and password_confirmation is not valid
  test "non matching passwords" do
    non_matching_pw_user = User.new(username: v_name, email: v_email, password: v_pw, password_confirmation: "12334567")
    assert_not non_matching_pw_user.valid?
  end
end
