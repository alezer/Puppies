require 'watir-webdriver'
#require 'rspec-expectations'

class Cart
  include PageObject

  button(:complete_adoption, :value => "Complete the Adoption")
  button(:adopt_another_puppy, :value => 'Adopt Another Puppy')

  def row_for(line_item)
    (line_item.to_i - 1) * 6
  end

  def cart_line_item(line_item)
    @browser.table(:index => 0)[row_for(line_item)]
  end

  def validate_information(data, line_item)
    cart_line_item(line_item.to_i).text.should include data
    #puts value.class
    #puts value.to_s
    #puts data.class
    #value.to_s include data.to_s

  end

  def validate_total(total)
    @browser.td(:class => 'total_cell').text.should == total
  end

end