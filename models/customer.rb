require_relative('../db/sql_runner.rb')
require_relative('film.rb')
require_relative('ticket.rb')

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1, $2) RETURNING *"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)
    @id = customer[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customer| Customer.new(customer) }
    return result
  end

end
