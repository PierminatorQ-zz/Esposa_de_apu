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

    #methods for show.html.erb table data

        #method for calculate how many times has breadfeeding each baby
        def breast_feeding_times_today
            breast_feedings.where("created_at >= :start_date AND created_at <= :end_date", {start_date: Time.now.beginning_of_day, end_date: Time.now}).count
        end

        #method for calculate last breastfeeding each baby
        def last_time_today
            
            #show a empty data if doesn exist any last record
            if breast_feedings > 0
            breast_feedings.last.created_at
            else
                ""
            end
            
        end

        #method for calculate duration for all breastfeedings today
        def breast_feeding_duration_today
            breast_feedings.where("created_at >= :start_date AND created_at <= :end_date", {start_date: Time.now.beginning_of_day, end_date: Time.now}).sum(:duration)
        end

        #method for calculate quantity for all breastfeedings today
        def breast_feeding_quantity_today
            breast_feedings.where("created_at >= :start_date AND created_at <= :end_date", {start_date: Time.now.beginning_of_day, end_date: Time.now}).sum(:quantity)
        end



end
