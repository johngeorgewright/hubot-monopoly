{EventEmitter} = require 'events'

DIE_SIZE = 6
EVENT_DOUBLE = 'rolled double'

emitter = new EventEmitter

roll = ->
  Math.ceil Math.random() * DIE_SIZE

exports.roll = (user) ->
  die1 = roll()
  die2 = roll()
  emitter.emit EVENT_DOUBLE, user, die1 if die1 is die2
  die1 + die2

exports.onDouble = (args...) ->
  emitter.on EVENT_DOUBLE, args...

exports.onceDouble = (args...) ->
  emitter.once EVENT_DOUBLE, args...
