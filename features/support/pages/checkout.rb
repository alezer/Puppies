class Checkout
  include PageObject
  include DataMagic

  text_field(:order_name, :id => "order_name")
  text_field(:order_address, :id => "order_address")
  text_field(:order_email, :id => "order_email")
  select_list(:order_pay_type, :id => "order_pay_type")
  button(:place_order, :value => "Place Order")

  def checkout(data = {})
    populate_page_with data_for(:checkout, data)
    place_order
  end

end