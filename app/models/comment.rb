class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
  scope :approved_commments?, -> { where(approved: true) }
  scope :unapproved_commments?, -> { where(approved: false) }
end
