require('pry')
require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer_1 = Customer.new(
  {
    'name' => 'Daniel',
    'funds' => '25'
  }
)
customer_1.save

customer_2 = Customer.new(
  {
    'name' => 'Callum',
    'funds' => '30'
  }
)
customer_2.save

film_1 = Film.new(
  {
    'title' => 'spider',
    'price' => '17'
  }
)
film_1.save

film_2 = Film.new(
  {
    'title' => 'moon',
    'price' => '19'
  }
)
film_2.save

ticket_1 = Ticket.new(
  {
    'customer_id' => customer_1.id,
    'film_id' => film_1.id
  }
)
ticket_1.save

ticket_2 = Ticket.new(
  {
    'customer_id' => customer_2.id,
    'film_id' => film_2.id
  }
)
ticket_2.save

binding.pry
nil
