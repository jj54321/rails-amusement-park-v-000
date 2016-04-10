class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets the Roller Coaster."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the Roller Coaster."
    else
      new_tickets = self.user.tickets - self.attraction.tickets
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      new_happiness = self.user.happiness + self.attraction.happiness_rating
      self.user.update(tickets: new_tickets, nausea: new_nausea, happiness: new_happiness)
    end
  end
end
