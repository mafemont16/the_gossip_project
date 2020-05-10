class Gossip < ApplicationRecord

    belongs_to :user
    has_many :tag_lists
    has_many :tags, through: :tag_lists
    has_many :comments
    has_many :likes

end
