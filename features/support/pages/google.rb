class Google
  include PageObject

  text_field(:search, :name => "q")
end