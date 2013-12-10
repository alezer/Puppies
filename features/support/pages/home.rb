class Home
  include PageObject

  page_url("http://puppies.herokuapp.com")
  paragraph(:notice, :id => 'notice')
  divs(:name, :class => 'name')

  def index_for(name)
    name_elements.find_index { |the_div| the_div.text == name }
  end

  def select_puppy(name)
    index = index_for(name)
    button_element(:value => 'View Details', :index => index).click
  end
end