class Booking < ApplicationRecord
    has_many :passengers
    belongs_to :flight, class_name: "Flight"
    accepts_nested_attributes_for :passengers
end
