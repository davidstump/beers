class Beer < ActiveRecord::Base
  belongs_to :brewery
  accepts_nested_attributes_for :brewery

  def as_json(options = {})
    {
      id: id,
      name: name,
      description: description,
      brewery: brewery
    }
  end
end
