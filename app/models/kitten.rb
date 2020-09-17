class Kitten < ApplicationRecord
  validates :cuteness, length: { in: 1..10 }
  validates :softness, length: { in: 1..10 }
end
