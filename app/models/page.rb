class Page < ActiveRecord::Base
  belongs_to :category
  belongs_to :type

  has_many :fields

  accepts_nested_attributes_for :fields, reject_if: :all_blank

  # page.url
  def method_missing name, *args, &block
    field = self.fields.find { |field| field.field_definition.key == name.to_s }
    if field
      field.value
    else
      super
    end
  end
end
