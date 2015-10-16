require 'rails_helper'

describe 'Post CRUD actions' do
  before do
    post = FactoryGirl.create(:post, id: 3)
    tag = FactoryGirl.create(:tag)
  end
  describe 'Creating posts' do
    it 'make a new post' do
      visit '/'
      click_link 'Add Post'
      fill_in 'post_title', with: "Hi there"
      fill_in 'post_content', with: 'Nice person'
      find(:css, "#tags_test").set(true)
      click_button "Create Post"
      expect(page).to have_content 'Hi there'
      expect(page).to have_content 'test'
    end
  end

  describe 'Editing posts' do
    it 'updates post' do
      visit '/posts/3'
      click_link 'Edit'
      fill_in 'post_title', with: "Editing"
      fill_in 'post_content', with: 'Post'
      find(:css, "#tags_test").set(true)
      click_button "Update Post"
      expect(page).to have_content 'Editing'
      expect(page).to have_content 'test'
    end
  end

  describe 'deleting a post' do
    it 'deletes a post' do
      visit '/posts/3'
      expect {   click_link("Delete", :match => :first) }.to change(Post, :count).by(-1)
    end
  end
end
