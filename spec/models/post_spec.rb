require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Test User', bio: 'Test Bio', photo: 'Test Photo Url') }
  subject { described_class.new }

  describe 'validations' do
    it 'should not be valid if title is missing' do
      subject.title = nil
      subject.text = 'Lorem'
      subject.author = user
      expect(subject).to_not be_valid
    end

    it 'should not be valid if text or author is missing' do
      subject.title = 'Title'
      subject.text = nil
      subject.author = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid' do
      subject.title = 'Title'
      subject.text = 'Text'
      subject.author = user
      expect(subject).to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:author).class_name(:User).with_foreign_key(:author_id) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
  end
end
