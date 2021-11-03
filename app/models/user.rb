class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  encrypts :private_api_key
  blind_index :private_api_key

  before_create :set_private_api_key

  validates :private_api_key, uniqueness: true, allow_blank: true

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }, format: { with: /\A[a-zA-Z0-9_]+\z/ }

  private

  def set_private_api_key
    self.private_api_key = SecureRandom.hex if self.private_api_key.nil?
  end

end
