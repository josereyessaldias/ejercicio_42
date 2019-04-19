class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:admin, :player]
  attribute :role, :integer, default: :player

  has_many :user_activity
  has_many :activities, through: :user_activity
  has_many :promote_activity
  has_many :billings
end
