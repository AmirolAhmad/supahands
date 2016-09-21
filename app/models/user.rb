class User < ApplicationRecord
  enum role: [:user, :agent]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks
end
