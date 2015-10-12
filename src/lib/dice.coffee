{EventEmitter} = require 'events'

DICE = 2
DIE_SIZE = 6
EVENT_DOUBLE = 'rolled doubled'

emitter = new EventEmitter

roll = ->
  score = 0
  score += Math.floor Math.random() * DIE_SIZE
  score

exports.roll = (user) ->
  die1 = roll()
  die2 = roll()
  emmiter.emit EVENT_DOUBLE, user, die1 if die1 is die2
  die1 + die2

exports.onDouble = emitter.on.bind EVENT_DOUBLE
exports.onceDouble = emitter.once.bind EVENT_DOUBLE
