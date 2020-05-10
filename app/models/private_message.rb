class PrivateMessage < ApplicationRecord
    belongs_to :sender,  class_name: "User"
    belongs_to :recipient,  class_name: "User"
    has_many :users, through: :recipients
    
    validates :content,
               presence: true,
               length: {in: 3..300}
end
