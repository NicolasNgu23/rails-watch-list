class List < ApplicationRecord
  validates :name, presence: true
  has_many :bookmarks
  has_many :movies, :through => :bookmarks
  validates :name, uniqueness: true
  has_many :movies, dependent: :destroy, :through => :bookmarks
end
