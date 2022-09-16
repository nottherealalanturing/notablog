require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Test User', bio: 'Test Bio', photo: 'Test Image Url') }

  describe 'Validations' do
    it 'is valid with attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if posts_counter is set to a none integer value' do
      subject.posts_counter = 'nil'
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:comments).with_foreign_key(:author_id).dependent(:destroy) }
    it { should have_many(:posts).with_foreign_key(:author_id).dependent(:destroy) }
    it { should have_many(:likes).with_foreign_key(:author_id).dependent(:destroy) }
  end
end
