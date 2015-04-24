class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.references :page, index: true, foreign_key: true
      t.references :field_definition, index: true, foreign_key: true
      t.string :value

      t.timestamps null: false
    end
  end
end
