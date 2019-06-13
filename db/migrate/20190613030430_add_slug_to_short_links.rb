class AddSlugToShortLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :short_links, :slug, :string
  end
end
