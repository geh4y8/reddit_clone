require 'active_record'
require './lib/post'
require './lib/user'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def menu
  choice = nil
  until choice == 'x'
    puts "Press a to add a new user"
    puts "Press l to login"
    choice = gets.chomp
    case choice
    when 'a'
      add_user
    when 'l'
      user_login
    when 'x'
      puts 'see ya next time'
    else
      puts 'not a valid option'
    end
  end
end

def add_user
  puts "Input your user name?"
  name = gets.chomp
  puts "Choose a password"
  password = gets.chomp
  user = User.create(name: name, password: password)
  puts "#{user.name} created!"
end

def user_login
  puts "What is your user name?"
  name = gets.chomp
  if User.find_by(name: name)
    puts "What is your password?"
    password = gets.chomp
    if User.find_by(password: password)
      puts "Thanks " + name + ", you are now logged in."
      user = User.find_by(name: name)
      post_menu(user.id)
    else
      puts 'sorry, wrong password, please try again'
      user_login
    end
  else
    puts "not a valid user name, please try again"
    user_login
  end
end


def post_menu(user_id)
  choice = nil
  until choice == 'x'
    puts "Press p to add a new post"
    puts "Press v to view all your posts"
    puts "Press a to view all posts on reddit for today"
    puts "Press n to view the 5 newest posts"
    choice = gets.chomp
    case choice
    when 'p'
      add_post(user_id)
    when 'v'
      view_posts(user_id)
    when 'a'
      view_todays_posts
    when 'n'
      view_newest_posts
    when 'x'
      menu
    else
      puts "not a valid option"
    end
  end
end

def add_post(user_id)
  puts "Enter the post details:"
  post = Post.create(description: gets.chomp, user_id: user_id)
  puts "Got it!"
  post_menu(user_id)
end

def view_posts(user_id)
  puts "Here are all of your posts in chronological order"
  posts = Post.where(user_id: user_id).order(:date)
  posts.each do |post|
    puts post.description
    puts post.created_at
  end
end

def view_todays_posts
  puts "Here are all of today's posts"
  Post.today.each { |post| puts post.description }
  #posts = Post.where(:date => Date.today)
  #posts.each {|post| puts post.description}
end
menu
