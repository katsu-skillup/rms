class Member < ApplicationRecord
belongs_to :user
has_many :meetings

with_options presence: true do
  validates :member_name
  validates :organization
  validates :work_info
  validates :valuation_id
  validates :communication
  validates :leadership
  validates :skill
  validates :motivation
end 

end
