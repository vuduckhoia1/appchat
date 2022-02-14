class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :username
    validates :username, presence: true, allow_blank: false
    validates :password, presence: true, allow_blank: false
    
    scope :all_except, ->(user) { where.not(id: user) }
    after_create_commit { broadcast_append_to "users" }
    has_many :messages
end
  