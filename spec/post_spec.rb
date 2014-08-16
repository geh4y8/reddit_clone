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
    post = Post.create(description: 'awesome reddit post', user_id: user.id, date: Date.today)
    post2 = Post.create(description: 'next awesome reddit post', user_id: user.id, date: Date.today)
    posts = Post.today(Date.today)
    expect(posts).to eq [post, post2]
  end

  it 'grabs all posts by the user in chron order' do
    user = User.create(name: 'Guy', password: 'green235235')
    user2 = User.create(name: 'OtherGuy', password: 'reallylongpassword')
    post = Post.create(description: 'awesome reddit post', user_id: user.id, date: Date.today)
    post2 = Post.create(description: 'next awesome reddit post', user_id: user.id, date: Date.today)
    post3 = Post.create(description: 'next awesome reddit post by user 2', user_id: user2.id, date: Date.today)
    posts = Post.where(user_id: user.id).order(:date)
    expect(posts).to eq [post, post2]
  end

  it 'grabs all the five newest posts' do
    user = User.create(name: 'Guy', password: 'green235235')
    post1 = Post.create(description: 'awesome reddit post', user_id: user.id, date: Date.today)
    post2 = Post.create(description: 'next awesome reddit post', user_id: user.id, date: Date.today)
    post3 = Post.create(description: 'next best reddit post', user_id: user.id, date: Date.today)
    post4 = Post.create(description: 'next next best awesome reddit post', user_id: user.id, date: Date.today)
    post5 = Post.create(description: 'almost last reddit post', user_id: user.id, date: Date.today)
    post6 = Post.create(description: 'last reddit post', user_id: user.id, date: Date.today)
    posts = Post.order(date: :asc).limit(5)
    expect(posts).to eq [post1,post2,post3,post4,post5]
  end
end
