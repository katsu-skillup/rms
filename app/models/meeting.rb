class Meeting < ApplicationRecord

belongs_to :user
belongs_to :member

with_options presence: true do
  validates :meeting_date
  validates :meeting_info
end 


end
