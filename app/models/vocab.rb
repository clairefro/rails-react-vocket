class Vocab < ApplicationRecord
  validates :french, presence: true
  validates :english, presence: true
end
