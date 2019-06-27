class Post < ApplicationRecord
   belongs_to :user
    validates :content, presence: true
    validates :answer, presence: true

    def next
        Post.where("id > ?", id).first
    end

    def prev
        Post.where("id < ?", id).last
    end
end
