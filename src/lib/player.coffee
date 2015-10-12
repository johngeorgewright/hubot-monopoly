dice = require './dice'

class Player
  constructor: (@name) ->
    @position = 0
    @deeds = []
    @property = []
    @money = 1500

  roll: ->
    dice.roll()

  hasDeed: (street) ->
    @deeds.filter((deed) -> deed.street is street).pop()

  buyProperty: (property) ->
    if @hasDeed property.street
      @money -= property.price
      @property.push property
    else
      throw new Error 'Player doesn\'t own the deed for that street'

  pay: (user, amount) ->
    money = if amount > @money then @money else amount
    @money -= money
    user.money += money

module.exports = Player
