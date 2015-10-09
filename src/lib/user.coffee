class User
  constructor: (@name, @piece) ->
    @position = 0
    @deeds = []
    @property = []
    @money = 1500

  roll: (die = 2, size = 6) ->
    score = 0
    score += Math.floor Math.random() * size for dice in [0...die]
    score

  hasDeed: (street) ->

  buy: (property) ->
    if @hasDeed property.street
      @money -= property.price
      @property.push property
    else
      throw new Error 'Player doesn\'t own the deed for that street'

  pay: (user, amount) ->
    money = if amount > @money then @money else amount
    @money -= money
    user.money = money
