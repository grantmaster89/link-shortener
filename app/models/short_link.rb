class ShortLink < ApplicationRecord
  before_save :update_slug
  validates_presence_of :original_url
  validates_uniqueness_of :original_url

  def to_param
    slug
  end

  def increase_visit
    self.view_count += 1
  end

  private

  def update_slug
    self.slug = generate_short_url_slug
  end

  def generate_short_url_slug
    # TODO: Think about adding 0-9
    Array.new(6) { Array("a".."z").sample }.join
  end
end
