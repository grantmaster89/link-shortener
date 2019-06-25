class SetActiveDefaultToShortLinks < ActiveRecord::Migration[5.2]
  def change
    change_column :short_links, :active, :boolean, default: true
  end
end
