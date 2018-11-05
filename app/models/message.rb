class Message < ApplicationRecord
  validates :user_id, presence: true
  validates :data, presence: true

  has_one :package

  include AASM
  
  aasm column: :state do
    state :waiting, initial: true
    state :sent
    state :system_error

    event :to_send do
      transitions from: :waiting, to: :sent
    end

    event :make_system_error do
      transitions to: :system_error
    end
  end
end