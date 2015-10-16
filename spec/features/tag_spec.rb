require 'rails_helper'

describe 'Tag CRUD actions' do
  before do
    tag = FactoryGirl.create(:tag, id: 3)
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end
  describe 'Creating tags' do
    it 'make a new tag' do
      visit '/'
      click_link 'Create Tag'
      fill_in 'tag_name', with: "Yay"
      click_button "Create Tag"
      expect(page).to have_content 'Yay'
    end
  end

  describe 'Editing posts' do
    it 'updates post' do
      visit '/tags/3'
      click_link 'Edit'
      fill_in 'tag_name', with: "Editing"
      click_button "Update Tag"
      expect(page).to have_content 'Editing'
    end
  end

  describe 'deleting a post' do
    it 'deletes a post' do
      visit '/tags/3'
      expect {   click_link("Delete", :match => :first) }.to change(Tag, :count).by(-1)
    end
  end
end
