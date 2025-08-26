class Monster < ApplicationRecord
  enum :element, { power:0, speed: 1, technic: 2 }
end
