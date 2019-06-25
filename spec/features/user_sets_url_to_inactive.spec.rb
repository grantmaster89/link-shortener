require "rails_helper"

feature "Admin sets url to inactive" do
  scenario "successfully" do
    visit root_path
    original_url = "https://www.example.com/really/long/path?with=query_params"
    create_shortened_url original_url

    visit admin_short_link_url
  end
end
