class Field < ActiveRecord::Base
  belongs_to :page
  belongs_to :field_definition
end
