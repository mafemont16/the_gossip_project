class Tag < ApplicationRecord
    has_many :tag_lists
    has_many :gossips, through: :tag_lists
    
    validates :title, length: {in: 3..14}

end
