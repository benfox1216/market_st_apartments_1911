require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'
require './lib/renter'
require './lib/apartment'

class BuildingTest < Minitest::Test
  def setup
    @building = Building.new
    
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
    @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 3, bedrooms: 2})
    
    @renter1 = Renter.new("Spencer")
    @renter2 = Renter.new("Jessie")
    @renter3 = Renter.new("Max")
  end
  
  def test_it_exists
    assert_instance_of Building, @building
  end
  
  def test_it_has_attributes
    assert_equal [], @building.units
    assert_equal 1099.5, @building.average_rent
  end
  
  def test_it_can_add_units
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    
    assert_equal [@unit1, @unit2, @unit3], @building.units
  end
  
  def test_it_can_return_renter_with_highest_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @unit2.add_renter(@renter1)
    @unit1.add_renter(@renter2)
    
    assert_equal @renter2, @building.renter_with_highest_rent
    
    @unit3.add_renter(@renter3)
    
    assert_equal @renter2, @building.renter_with_highest_rent
  end
  
  def test_it_can_return_an_annual_breakdown
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @unit2.add_renter(@renter1)
    
    assert_equal {"Spencer" => 11988}, @building.annual_breakdown
    
    @unit1.add_renter(@renter2)
    
    assert_equal {"Jessie" => 14400, "Spencer" => 11988}, @building.annual_breakdown
  end
end
