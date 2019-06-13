require "rails_helper"

describe ShortLink, type: :model do
  it "is not valid with nil url" do
    short_link = ShortLink.new(original_url: nil)
    expect(short_link).to_not be_valid
  end

  it "should be a valid url" do
    short_link = ShortLink.new(original_url: "website.com")
    expect(short_link).to_not be_valid
  end
end
