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

  pay: (amount, user) ->
    if amount > @money
      throw new Error "Player #{@name} doesn't have enough money"
    @money -= amount
    user.money += amount

module.exports = Player
