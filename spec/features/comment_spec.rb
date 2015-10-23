require 'rails_helper'

describe 'Post CRUD actions' do
  before do
    @post = FactoryGirl.create(:post)
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end
  describe 'Creating comments on a post' do
    it 'make a new comment' do
      visit post_path(@post)
      fill_in 'comment_content', with: "Hi people"
      click_button "Create Comment"
      expect(page).to have_content 'Hi people'

    end
  end
  describe 'Creating comments on a user' do
    it 'make a new comment' do
      visit user_path(@user)
      fill_in 'comment_content', with: "Hi people"
      click_button "Create Comment"
      expect(page).to have_content 'Hi people'

    end
  end

  describe 'Editing post comments' do
    it 'updates comment' do
      comment = FactoryGirl.create(:comment, commentable_type: "Post", commentable_id: @post.id, user_id: @user.id)
      visit post_path(@post)
      click_link 'edit'
      fill_in 'comment_content', with: "Hey y'all"
      click_button "Update Comment"
      expect(page).to have_content "Hey y'all"
    end
  end

  describe 'Editing user comments' do
    it 'updates comment' do
      comment = FactoryGirl.create(:comment, commentable_type: "User", commentable_id: @user.id, user_id: @user.id)
      visit user_path(@user)
      click_link 'edit'
      fill_in 'comment_content', with: "Hey y'all"
      click_button "Update Comment"
      expect(page).to have_content "Hey y'all"
    end
  end

  describe 'deleting post comments' do
    it 'deletes a comment' do
      comment = FactoryGirl.create(:comment, commentable_type: "Post", commentable_id: @post.id, user_id: @user.id)
      visit post_path(@post)
      expect {   click_link("delete", :match => :first) }.to change(Comment, :count).by(-1)
    end
  end

  describe 'deleting user comments' do
    it 'deletes a comment' do
      comment = FactoryGirl.create(:comment, commentable_type: "User", commentable_id: @user.id, user_id: @user.id)
      visit user_path(@user)
      expect {   click_link("delete", :match => :first) }.to change(Comment, :count).by(-1)
    end
  end
end
