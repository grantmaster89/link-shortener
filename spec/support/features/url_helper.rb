module Features
  def create_shortened_url(original_url)
    fill_in "Paste a url", with: original_url
    click_on "Shorten"
  end

  def display_shortened_url(original_url)
    have_css "span", text: /((http[s]?|ftp):\/)?\/?([^\/\s]+)(\/s\/)+([a-zA-Z0-9]{6})/m
  end

  def display_obfuscated_url(original_url)
    have_css "span", text: /^((http[s]?|ftp):\/)?\/?([^\/\s]+)(\/s\/)+([a-zA-Z0-9])(\*+)([a-zA-Z0-9])/
  end

  def display_original_url(original_url)
    have_css "#og", text: original_url
  end
end
