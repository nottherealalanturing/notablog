class Comment < ApplicationRecord
    belongs_to :author, class_name: "user", foreign_key: "author"
    belongs_to :post
end
