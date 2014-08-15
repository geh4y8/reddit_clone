require 'spec_helper'

describe 'User' do
  it 'creates a new user with a name' do
    user = User.create(name: 'Guy')
    expect(user).to be_a User
  end
end
