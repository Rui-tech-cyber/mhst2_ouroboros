class Monster < ApplicationRecord
  has_many :monster_states, dependent: :destroy
end
