class Post < ApplicationRecord
    belongs_to :user
    has_many :points

    validates :picture, presence: true

    validates :vegetable, presence: true
    validates :garlic, presence: true
    validates :pig, presence: true
    validates :backfat, presence: true
    validates :noodle, presence: true

    validates :store_name, presence: true, length: {maximum:15}
    validates :name, presence: true, length: {maximum:15}

    
    before_save do
        self.point = (self.vegetable + self.backfat + self.pig + self.noodle + self.garlic ).fdiv(5)
    end
end
