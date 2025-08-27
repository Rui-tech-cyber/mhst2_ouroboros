class MonsterState < ApplicationRecord
  belongs_to :monster
  enum :element, { power: 0, speed: 1, technique: 2 } # パワー/スピード/テクニック
end
