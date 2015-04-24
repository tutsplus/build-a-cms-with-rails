class CreateFieldDefinitions < ActiveRecord::Migration
  def change
    create_table :field_definitions do |t|
      t.references :type, index: true, foreign_key: true
      t.string :key

      t.timestamps null: false
    end
  end
end
