require "rails_helper"

feature "User visits homepage" do
  scenario "successfully" do
    visit root_path

    expect(page).to have_css "a", text: "Url Shortener"
  end
end
