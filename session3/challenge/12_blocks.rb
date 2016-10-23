# You have software to take payment from a customer
# There are 4 ways to pay, and they are all very similar.
# One day, you are paying by cash, and you realize you never calculated the tax!
# So you went in to your code and added order.compute_tax to the pay_by_cash method.
# Everything was great, until you realized you forgot to add it to pay_by_check also!
#
# You fixed this bug already, but the same code is duplicated in many places,
# so the bug fix didn't get everything. Frustrated, you decide to refactor your code.
#
# You see a lot of duplciation, but unfortunately, right in the middle of each of these
# pieces of code, is a line or two that changes every time.
#
# Thinking a little bit, you realize that you could create a method that performs this
# boiler plate code, then calls a block which does the custom code.
#
# You decide to name it pay_by.
#
# **Create the pay_by method, and refactor each of the four methods below such that they
# invoke the pay_by method, and pass it the order, to take care of the code that is all the same
# Let them pass a block to take care of the code that is unique.**
#
# NOTE: This code will only work with the rake tests, which will define the order and current_user
# you will not be able to run this code outside of the test

# e.g. square_it_proc = Proc.new { |num| num * num }

def pay_by(order)
  order.compute_cost = Proc.new
  order.compute_shipping = Proc.new
  order.compute_tax = Proc.new
  order.ship_goods = Proc.new


end



def pay_by_visa(order, ccn)
  order.payment :type => :visa, :ccn => ccn
  order.verify_payment
  order.compute_cost = pay_by.call(order)
  order.compute_shipping = pay_by.call
  order.compute_tax = pay_by.call
  order.ship_goods = pay_by.call
end

def pay_by_check(order)
  order.payment :type => :check, :signed => true
  pay_by.call(order)
  order.compute_cost = pay_by.call
  order.compute_shipping = pay_by.call
  order.compute_tax = pay_by.call
  order.ship_goods = pay_by.call
end

def pay_by_cash(order)
  order.payment :type => :cash
  pay_by.call(order)
  order.compute_cost = pay_by.call
  order.compute_shipping = pay_by.call
  order.compute_tax = pay_by.call
  order.ship_goods = pay_by.call
end

def pay_by_store_credit(order)
  order.payment :type => :store_credit
  current_user.store_credit -= order.cost   # current_user is a method with no params (ie, the customer)
  pay_by.call(order)
  order.compute_cost = pay_by.call
  order.compute_shipping = pay_by.call
  order.compute_tax = pay_by.call
  order.ship_goods = pay_by.call
end
