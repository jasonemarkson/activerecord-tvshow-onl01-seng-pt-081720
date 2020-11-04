require 'pry'

class Show < ActiveRecord::Base

    def self.highest_rating
        maximum("rating")
    end

    def self.most_popular_show
        all.find do |s|
            if s.rating == highest_rating
                s.name
            end
        end
    end

    def self.lowest_rating
        minimum("rating")
    end

    def self.least_popular_show
        all.find do |s|
            if s.rating == lowest_rating
                s.name
            end
        end
    end

    def self.ratings_sum
        sum("rating")
    end

    def self.popular_shows
        popular_shows = []
        all.collect do |show|
            if show.rating > 5
                popular_shows << show 
            end
        end
        popular_shows
    end

    def self.shows_by_alphabetical_order
        all.order(:name)
    end
end