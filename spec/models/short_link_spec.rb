require "rails_helper"

describe ShortLink, type: :model do
  example_url = "https://www.example.com/really/long/path?with=query_params"
  it "is not valid with nil url" do
    short_link = ShortLink.new(original_url: nil)
    expect(short_link).to_not be_valid
  end

  it "should be a valid url" do
    short_link = ShortLink.new(original_url: "website.com")
    expect(short_link).to_not be_valid
  end

  describe ShortLink, "#active?" do
    it "returns true if active is set" do
      short_link = ShortLink.create!(original_url: example_url)

      expect(short_link).to be_active
    end

    it "returns false if active is nil" do
      short_link = ShortLink.create!(original_url: example_url, active: nil)

      expect(short_link).not_to be_active
    end
  end

  describe ShortLink, "#obfuscate_url" do
    it "returns obfuscated url to admin page" do
      short_link = ShortLink.create!(original_url: example_url)

      expect(short_link.admin_url).to match(/^((http[s]?|ftp):\/)?\/?([^:\/\s]+)(\/s\/)+([a-zA-Z0-9])(\*+)([a-zA-Z0-9])/)
    end
  end
end
