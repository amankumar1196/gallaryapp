class Album < ActiveRecord::Base
    belongs_to :user
    has_many :posts
    has_many :album_tags
    has_many :tags, through: :album_tags
    
    accepts_nested_attributes_for :tags, allow_destroy: true

    validates :title, presence: true, uniqueness: true, length: {minimum:3}
    validates :description, presence: true, length: {minimum:20}
    validates :user_id, presence: true
end