class Map < ActiveRecord::Base
  validates :question, presence: true
  validates :answer, presence: true
  validates :bounds, presence: true
end
