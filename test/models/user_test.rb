require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def create_user_routine
    new_user = User.new
    new_user.name = 'Test'
    new_user.password = '123456'
    new_user.email = 'test@user.com'
    return new_user
  end

  ## TRYING TO GET A USER THAT DOES NOT EXISTS IN THE DATABASE
  test 'trying to get a user that does not exists' do
    assert_raises('RecordNotFound') { User.find(rand()) }
  end

  ## TRYING TO CREATE A INVALID USER
  # A invalid User does not have a name, email or password
  # A invalid User does not contain a valid email
  test 'trying to create a invalid user' do
    new_invalid_user = User.new
    
    assert_not new_invalid_user.save
    assert_not new_invalid_user.valid?
    
    new_invalid_user.name = 'Invalid User'
    new_invalid_user.password = '123'
    new_invalid_user.email = 'invalid_email'
    
    assert_not new_invalid_user.valid?
    assert_not new_invalid_user.save
  end

  ## TRYING TO CREATE A VALID USER
  test 'trying to create a valid user' do 
    new_user = create_user_routine

    assert new_user.valid?
    assert new_user.save
  end

  ## TRYING TO GET A USER
  test 'trying to get a user that has created' do
    new_user = create_user_routine
    
    expected_return = {
      id: 0,
      name: 'dan',
      email: 'dan@dan.com',
    }
    puts User.get(new_user.id)
    assert_not User.exists?(new_user.id)
  end
  ## TRYING TO UPDATE A USER WITH INVALID DATA
  ## TRYING TO UPDATE A USER WITH VALID DATA
  ## TRYING TO SOFT DELETE
  ## TRYING TO ACCESS A USER THAT WAS SOFT DELETED
  ## TRYING TO ACCESS THE TODOS LIST ASSOCIATED WITH THAT USER
  ## TRYING TO HARD DELETE A USER
end