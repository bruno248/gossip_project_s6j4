class Gossip < ApplicationRecord
    belongs_to :user
    has_many :join_gossip_tags
    has_many :tag, through: :join_gossip_tags

    validates :title,
        presence: true,
        uniqueness: true ,
        length: { in: 3..50 }
    
    validates :content,
        presence: true,
        uniqueness: true,
        length: { minimum: 20 }
end
