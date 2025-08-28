class MonsterState < ApplicationRecord
  belongs_to :monster

  enum element: { power: 0, speed: 1, technique: 2, no_form: 3 } # パワー/スピード/テクニック/形態変化なし
end
