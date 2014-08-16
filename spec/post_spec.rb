require 'spec_helper'

describe 'Post' do
  it 'creates a new post with a user' do
    user = User.create(name: 'Guy', password: 'green235235')
    post = Post.create(description: 'awesome reddit post', user_id: user.id)
    post2 = Post.create(description: 'next awesome reddit post', user_id: user.id)
    expect(user.posts).to eq [post, post2]
  end

  it 'grabs all posts from today' do
    user = User.create(name: 'Guy', password: 'green235235')
    post = Post.create(description: 'awesome reddit post', user_id: user.id)
    post2 = Post.create(description: 'next awesome reddit post', user_id: user.id)
    posts = Post.where(:date => Date.today)
    expect(posts).to eq [post, post2]
  end
end
