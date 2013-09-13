class AddTitleToDestinations < ActiveRecord::Migration
  def change
    change_table :destinations do |t|
      t.string :title
    end
  end
end
