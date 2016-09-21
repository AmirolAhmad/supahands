class Task < ApplicationRecord
  include AASM
  enum status: [:pending, :working, :complete, :rejected]
  belongs_to :user

  aasm do
    event :completed do
      transitions :from => :working, :to => :complete
    end
  end

  def mark_completed?
    if self.complete?
      #we need join table here
      balance = (self.user.hands - 1)
      self.user.update(hands: balance)
  end
end
