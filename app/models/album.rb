class Album < ActiveRecord::Base
    validates :title, presence: true, uniqueness: true, length: {minimum:3}
    validates :description, presence: true, length: {minimum:50}
end