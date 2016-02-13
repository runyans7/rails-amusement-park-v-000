class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if happiness && nausea
      happiness > nausea ? "happy" : "sad"
    end
  end
end
