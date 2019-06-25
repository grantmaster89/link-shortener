class ShortLink < ApplicationRecord
  before_create :update_slug
  validates_presence_of :original_url
  validates_uniqueness_of :original_url
  validates :original_url, format: URI::regexp(%w[http https])

  def to_param
    slug
  end

  def host
    URI.parse(original_url).host
  end

  def admin_url
    url = slug
    host + "/s/" + url[0] + "****" + url[-1]
  end

  def short_url
    url = slug
    host + "/s/" + url
  end

  def increase_visit
    self.view_count += 1
    save!
  end

  private

  def update_slug
    self.slug = generate_short_url_slug
  end

  def generate_short_url_slug
    # TODO: Think about adding 0-9
    Array.new(6) { (Array("a".."z") + Array("A".."Z") + Array("0".."9")).sample }.join
  end
end
