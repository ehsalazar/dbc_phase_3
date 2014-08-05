require 'spec_helper'
describe PostsController do
  let(:category) { FactoryGirl.create :category }
  context "#index" do
    it "is successful" do
      get :index, :category_id => category.id
      expect(response).to be_success
    end

    it "assigns posts to all Post.all" do
      get :index, :category_id => category.id
      expect(assigns(:posts)).to eq Post.all
    end
  end

  context "show" do
    let(:post) { FactoryGirl.create :post }
    it "is successful" do
      get :show, :id => post.id, :category_id => category.id
      expect(response).to be_success
    end

    it "assigns @post to the Post found by id" do
      get :show, :id => post.id, :category_id => category.id
      expect(assigns(:post)).to eq post
    end
  end

  context "new" do
    it "is successful" do
      get :new, :category_id => category.id
      expect(response).to be_success
    end

    it "assigns @post to the Post found by id" do
      get :new, :category_id => category.id
      expect(assigns(:post)).to be_a_new Post
    end
  end

  context "create" do
    it "creates with valid attributes" do
      expect {
        post :create, :category_id => category.id, :post => FactoryGirl.attributes_for(:post)
      }.to change { Post.count }.by(1)
      expect(response).to be_redirect
    end

    it "doesn't create if attributes are invalid" do
      expect {
        post :create, :category_id => category.id
      }.not_to change { Post.count }
      expect(response).not_to be_redirect
    end
  end

  context "edit" do
    let(:post) { FactoryGirl.create :post }
    it "is successful" do
      get :edit, :id => post.id, :category_id => category.id
      expect(response).to be_success
    end

    it "assigns @post to the Post found by id" do
      get :edit, :id => post.id, :category_id => category.id
      expect(assigns(:post)).to eq post
    end
  end

  context "update" do
    let!(:post) { FactoryGirl.create :post }
    it "updates with valide attributes" do
      expect {
        put :update, :category_id => category.id, :id => post.id, :post => {:title => "yo"}
      }.to change { post.reload.title }.to("yo")
      expect(response).to be_redirect
    end

    it "doesn't update if attributes are invalid" do
      expect {
        put :update, :category_id => category.id, :id => post.id, :post => {:title => nil}
      }.to_not change { post.reload.title }
      expect(response).not_to be_redirect
    end
  end

  context "destroy" do
    let!(:post) { FactoryGirl.create :post }
    it "destroys the record" do
      expect {
        delete :destroy, :category_id => category.id, :id => post.id
      }.to change { Post.count }.by(-1)
    end
  end
end
