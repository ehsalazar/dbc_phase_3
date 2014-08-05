require 'spec_helper'

describe Category do
  before :each do
    Post.destroy_all
    Category.destroy_all
  end
  context "validations" do
    it { should validate_presence_of :name }
    it "name must be present" do
      expect {
        category = Category.new
        category.save
        expect(category.errors.full_messages).to include("Name can't be blank")
      }.not_to change { Category.count }
    end
  end

  context "associations" do
    it { should have_many :posts }
    it "has many posts" do
      expect {
        category = FactoryGirl.build :category
        category.posts << FactoryGirl.build(:post)
        category.save
      }.to change { Post.count }.by(1)
    end
  end
end
