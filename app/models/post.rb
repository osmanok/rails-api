class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  scope :recent, -> { order(created_at: :desc) }
  scope :published, -> { where(visible: true) }
end
