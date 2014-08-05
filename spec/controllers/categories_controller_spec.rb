require 'spec_helper'

describe CategoriesController do

  context "#index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end

    it "assigns categories to all Category.all" do
      get :index
      expect(assigns(:categories)).to eq Category.all
    end
  end

  context "show" do
    let(:category) { FactoryGirl.create :category }
    it "is successful" do
      get :show, :id => category.id
      expect(response).to be_success
    end

    it "assigns @category to the Category found by id" do
      get :show, :id => category.id
      expect(assigns(:category)).to eq category
    end
  end

  context "new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end

    it "assigns @category to the Category found by id" do
      get :new
      expect(assigns(:category)).to be_a_new Category
    end
  end

  context "create" do
    it "creates with valid attributes" do
      expect {
        post :create, :category => FactoryGirl.attributes_for(:category)
      }.to change { Category.count }.by(1)
      expect(response).to be_redirect
    end

    it "doesn't create if attributes are invalid" do
      expect {
        post :create
      }.not_to change { Category.count }
      expect(response).not_to be_redirect
    end
  end

  context "edit" do
    let(:category) { FactoryGirl.create :category }
    it "is successful" do
      get :edit, :id => category.id
      expect(response).to be_success
    end

    it "assigns @category to the Category found by id" do
      get :edit, :id => category.id
      expect(assigns(:category)).to eq category
    end
  end

  context "update" do
    let!(:category) { FactoryGirl.create :category }
    it "updates with valide attributes" do
      expect {
        put :update, :id => category.id, :category => {:name => "yo"}
      }.to change { category.reload.name }.to("yo")
      expect(response).to be_redirect
    end

    it "doesn't update if attributes are invalid" do
      expect {
        put :update, :id => category.id, :category => {:name => nil}
      }.to_not change { category.reload.name }
      expect(response).not_to be_redirect
    end
  end

  context "destroy" do
    let!(:category) { FactoryGirl.create :category }
    it "destroys the record" do
      expect {
        delete :destroy, :id => category.id
      }.to change { Category.count }.by(-1)
    end
  end
end
