class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :followeds, through: :relationships, source: :followed

  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  def is_followed_by?(user)
    followeds.include?(user)
  end

  attachment :profile_image

  validates :name, uniqueness: true
  validates :name, presence: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

end