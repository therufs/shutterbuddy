class Landmark < ActiveRecord::Base
  belongs_to :search
  accepts_nested_attributes_for :photo
end
