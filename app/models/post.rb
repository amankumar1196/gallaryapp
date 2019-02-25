class Post < ApplicationRecord
    has_one_attached :file
    belongs_to :album
end
