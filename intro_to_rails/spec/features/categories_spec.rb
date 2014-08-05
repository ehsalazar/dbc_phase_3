require 'spec_helper'
describe "Categories", :js => true do
  let!(:category) { FactoryGirl.create :category }
  let!(:post) { FactoryGirl.create :post, :category => category }
  context "homepage" do
    it "lists all the Categories" do
      visit root_path
      expect(page).to have_content category.name
    end
  end

  context "category page" do
    it "shows the name and the list of posts associated with it" do
      visit root_path
      click_on category.name
      expect(page).to have_content category.name
      expect(page).to have_content post.title
    end
  end

  context "create a category" do
    it "redirects to the category page if successful" do
      visit new_category_path
      fill_in "Name", :with => "business"
      click_on "Create Category"
      expect(page).to have_content "business"
    end

    it "renders the form with errors if unsuccessful" do
      visit new_category_path
      click_on "Create Category"
      expect(page).to have_content "Name can't be blank"
    end
  end

  context "update a category" do
    it "redirects to the category page if successful" do
      visit edit_category_path(category)
      fill_in "Name", :with => "business"
      click_on "Update Category"
      expect(page).to have_content "business"
    end

    it "renders the form with errors if unsuccessful" do
      visit edit_category_path(category)
      fill_in "Name", :with => ""
      click_on "Update Category"
      expect(page).to have_content "Name can't be blank"
    end
  end
end
