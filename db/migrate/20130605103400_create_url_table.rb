class CreateUrlTable < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :short_url
      t.string :url
      t.integer :click_counter
    end
  end
end
