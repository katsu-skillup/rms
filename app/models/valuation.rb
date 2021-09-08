class Valuation < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択して下さい' },
    { id: 2, name: 'S'},
    { id: 3, name: 'A'},
    { id: 4, name: 'B'},
    { id: 5, name: 'C'}
  ]

  include ActiveHash::Associations
  has_many :members

end