class AddCategoryToPages < ActiveRecord::Migration
  def change
    add_reference :pages, :category, index: true, foreign_key: true
  end
end
