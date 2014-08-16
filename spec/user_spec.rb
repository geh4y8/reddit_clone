require 'spec_helper'

describe 'User' do
  it 'creates a new user with a name and password' do
    user = User.create(name: 'Guy', password: 'green47388')
    expect(user).to be_a User
  end
end
