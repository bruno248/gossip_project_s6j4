class Tag < ApplicationRecord
    has_many :join_gossip_tags
    has_many :gossips, through: :join_gossip_tags

    validates :title,
        presence: true,
        uniqueness: true,
        length: { in: 3..25}
end
