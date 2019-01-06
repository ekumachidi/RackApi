class Database
  USERS = {
    1 => { name: "Jason", bike: "Cannondale" },
    2 => { name: "Caroline", bike: "Trek" }, 
    3 => { name: "Debby", bike: "Yamaha" },
    4 => { name: "Chidi", bike: "Harley D" }
  }

  def self.users
    USERS
  end

  RIDES = {
    1 => { user_id: 1, title: "Morning Commute", date: "2018-09-28" },
    2 => { user_id: 1, title: "Evening Commute", date: "2018-09-08" },
    3 => { user_id: 4, title: "Night Commute", date: "2018-12-31" }
  }

  def self.rides
    RIDES
  end

  def self.add_ride(ride)
    RIDES.store(RIDES.keys.last+1, ride)
  end
end
