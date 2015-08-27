require_relative '../spec_helper'

describe 'New task', :type => :feature do
  it "creates a new task" do
    visit "/"
    within(".navbar") do
      click_link "New Task"
    end
    fill_in("task[title]", with: "sweet ass title")
    fill_in("task[description]", with: "sweet ass description")
    click_button("Submit")

    expect(page).to have_content("sweet ass description")
  end
end
