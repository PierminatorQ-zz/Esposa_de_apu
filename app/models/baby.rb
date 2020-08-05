class Baby < ApplicationRecord
    has_many :breast_feedings, dependent: :destroy
#create a relationship between baby and breastfeeding models
    
    validates :name, uniqueness: true
#validates a unique name for each baby

#methods for index.baby to add data: total quantity of drinking and total duration of drinking
    #total quantity drinked
    def total_drinking
        breast_feedings.sum(:quantity)
    end
    #total duration of drinking for baby
    def total_duration
        breast_feedings.sum(:duration)
    end

    #method to_s to convert each modelo called to a data
    def to_s
        name
    end
end
