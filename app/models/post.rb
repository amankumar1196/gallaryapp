class Post < ApplicationRecord
    paginates_per 8
    has_one_attached :file
    belongs_to :album
end
