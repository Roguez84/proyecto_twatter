class CreateTwats < ActiveRecord::Migration[5.2]
  def change
    create_table :twats do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
