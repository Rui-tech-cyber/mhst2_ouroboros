class SearchHistory < ApplicationRecord
  validates :keyword, presence: true

  scope :recent, -> { order(created_at: :desc).limit(10) }
end
