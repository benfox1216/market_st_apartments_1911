class Building
  attr_reader :units, :average_rent
  
  def initialize
    @units = []
    @average_rent = 1099.5
  end
  
  def add_unit(new_unit)
    @units << new_unit
  end
  
  def renter_with_highest_rent
    units_with_renters = @units.find_all do |unit|
      unit.renter != nil
    end
    
    highest_rent_unit = units_with_renters.max_by do |unit|
      unit.monthly_rent
    end
    
    highest_rent_unit.renter
  end
  
  def annual_breakdown
    units_with_renters = @units.find_all do |unit|
      unit.renter != nil
    end
    
    names = units_with_renters.map {|unit| unit.renter.name}
    
    annual_rent = units_with_renters.map {|unit| (unit.monthly_rent) * 12}
    
    annual_breakdown = {}
    
    unit_with_renters.map do |unit|
      annual_rent[name[0]] = annual_rent[0]
      name.shift
      annual_rent.shift
    end
  end
end