require 'rails_helper'

def testgroup
  it 'displays the post title' do
    expect(page).to have_content(@first_post.title)
  end
  it 'displays the post body' do
    expect(page).to have_content(@first_post.text)
  end
  it 'display the first comment on a post' do
    expect(page).to have_content('Hi Lilly!')
  end
  it 'display the how many comments' do
    expect(page).to have_content("#{@first_post.comments_counter} comment")
  end
  it 'display the how many Likes' do
    expect(page).to have_content("#{@first_post.likes_counter} like")
  end
  it 'after clicking on a post, redirect on a post show page' do
    click_link(@first_post.title)
    expect(page).to have_content("#{@first_post.comments_counter} comment")
  end
end

RSpec.feature 'Post Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/ph=80', bio: 'Teacher from Poland.')
    @user2 = User.create(name: 'Tom', photo: 'https://images.unsplash.com/ph=80', bio: 'Teacher from Poland.')
    @first_post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    5.times do |_i|
      Comment.create(post: @first_post, author: @user2, text: 'Hi Lilly!')
    end
    visit user_posts_path(@user)
  end
  it 'displays user profile picture' do
    expect(page.find(:css, '.post_page_image')[:src]).to have_content(@user.photo)
  end
  it 'displays number of posts' do
    expect(page).to have_content('Number of posts: 1')
  end
  it "displays the user's username " do
    expect(page).to have_content(@user.name)
  end

  testgroup
end
