require "rails_helper"

feature "User creates a shortened url" do
  scenario "successfully" do
    visit root_path
    original_url = "https://www.example.com/really/long/path?with=query_params"
    create_shortened_url original_url

    expect(page).to display_shortened_url original_url
    # expect(page).to display_original_url original_url
  end
end
