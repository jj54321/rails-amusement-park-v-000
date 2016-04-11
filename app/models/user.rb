class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness && self.nausea
      if self.nausea > self.happiness
        'sad'
      else
        'happy'
      end
    end
  end

end
