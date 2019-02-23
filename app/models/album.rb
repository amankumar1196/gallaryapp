class Album < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true, uniqueness: true, length: {minimum:3}
    validates :description, presence: true, length: {minimum:20}
    validates :user_id, presence: true
end