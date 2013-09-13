class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :namespace, null: false, default: ""
      t.string :slug, null: false, default: ""
      t.string :url_string, null: false, default: ""
      t.text :data
      t.timestamps
    end
  end
end
