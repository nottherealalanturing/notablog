class Like < ApplicationRecord
    belongs_to :author, class_name: "User", foreign_key: "author"
    belongs_to :post
end
