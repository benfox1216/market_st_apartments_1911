class Apartment
  attr_reader :attributes, :number, :monthly_rent, :bathrooms, :bedrooms, :renter
  
  def initialize(attributes)
    @attributes = attributes
    @number = attributes[:number]
    @monthly_rent = attributes[:monthly_rent]
    @bathrooms = attributes[:bathrooms]
    @bedrooms = attributes[:bedrooms]
    @renter = nil
  end

  def add_renter(new_renter)
    @renter = new_renter
  end
end