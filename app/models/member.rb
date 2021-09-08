class Member < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :valuation

  belongs_to :user
  has_many :meetings, dependent: :destroy
  has_one_attached :image, dependent: :destroy

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

  validates :valuation_id, numericality: { other_than: 1 } 
end
