{EventEmitter} = require 'events'
dice = require './dice'

class Player
  constructor: (@name) ->
    @position = 0
    @deeds = []
    @property = []
    @money = 1500
    @emitter = new EventEmitter

  roll: ->
    dice.roll @emitter

  hasDeed: (street) ->
    @deeds
      .filter (deed) -> deed.street is street
      .length > 0

  canAfford: (price) ->
    price <= @money

  buy: (property) ->
    if !@hasDeed(property.street) and @canAfford(property.price)
      @money -= property.price
      @property.push property
    else
      throw new Error 'Player doesn\'t own the deed for that street'

  pay: (user, amount) ->
    money = if amount > @money then @money else amount
    @money -= money
    user.money = money
