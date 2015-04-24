class AddTypeToPages < ActiveRecord::Migration
  def change
    add_reference :pages, :type, index: true, foreign_key: true
  end
end
