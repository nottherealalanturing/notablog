require 'rails_helper'

RSpec.feature 'Test Post show', type: :feature do
  before :each do
    @user = User.create(name: 'Jake', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Algeria.')
    @user2 = User.create(name: 'Joel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Student at microverse.')
    @post = Post.create(author: @user, title: 'Post 1', text: 'This is my new post')
    Comment.create(post: @post, author: @user2, text: 'Hi Lilly!')
    Comment.create(post: @post, author: @user2, text: 'Hi Lilly!')

    visit user_post_path(@post.author, @post)
  end
  it "I can see the post's title" do
    expect(page).to have_content(@post.title)
  end
  it 'I can see who wrote the post' do
    expect(page).to have_content(@user.name)
  end
  it 'I can see how many comments it has' do
    expect(page).to have_content('2 comments')
  end
  it 'I can see how many likes it has' do
    expect(page).to have_content('0 likes')
  end
  it 'I can see the post body' do
    expect(page).to have_content(@post.text)
  end
  it 'I can see the username of each commentor' do
    expect(page).to have_content(@user2.name)
  end
  it 'I can see the comment each commentor left' do
    expect(page).to have_content('Hi Lilly!')
  end
end
