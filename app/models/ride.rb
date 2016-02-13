class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if rider_tall_enough && rider_has_enough_tickets
      start_ride
    elsif !rider_tall_enough && rider_has_enough_tickets
      "Sorry. #{height_message}"
    elsif !rider_has_enough_tickets && rider_tall_enough
      "Sorry. #{ticket_message}"
    else
      "Sorry. #{ticket_message} #{height_message}"
    end
  end

  def start_ride
    tickets_remaing = self.user.tickets - self.attraction.tickets
    new__nasusea = self.user.nausea + self.attraction.nausea_rating
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    self.user.update(tickets: tickets_remaing, 
                    nausea: new__nasusea,
                    happiness: new_happiness)
    "Thanks for riding the #{self.attraction.name}!"
  end

  def rider_tall_enough
    self.user.height >= self.attraction.min_height
  end

  def rider_has_enough_tickets
    self.user.tickets >= self.attraction.tickets
  end

  def ticket_message
    "You do not have enough tickets the #{self.attraction.name}."
  end

  def height_message
    "You are not tall enough to ride the #{self.attraction.name}."
  end

end
