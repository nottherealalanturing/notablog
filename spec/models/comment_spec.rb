require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Test User', bio: 'Test Bio', photo: 'Test Image Url') }
  let(:blog) { Post.create(author: user, title: 'New Post', text: 'Lorem Ipsum') }
  subject { described_class.new }

  describe 'Validation' do
    it 'should not be valid without a user_id or text' do
      subject.author = nil
      subject.post = blog
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'should not be valid without a post_id' do
      subject.author = user
      subject.post = nil
      subject.text = 'Fake Comment'
      expect(subject).to_not be_valid
    end

    it 'it should be valid' do
      subject = described_class.create(author: user, post: blog, text: 'Fake Comment')
      expect(subject).to be_valid
    end
  end

  describe 'Add Comment to post' do
    it 'should add a new comment to post' do
      subject = described_class.create(author: user, post: blog, text: 'Fake Comment')
      expect(subject.post.comments_counter).to eq(1)
    end
  end

  describe 'Associations' do
    it { should belong_to(:author).class_name(:User).with_foreign_key(:author_id) }
    it { should belong_to(:post) }
  end
end
