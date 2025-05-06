class Question < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy  # This line should be present
  validates :title, :body, presence: true
end
