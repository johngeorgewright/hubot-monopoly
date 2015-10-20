DIE_SIZE = 6

roll = ->
  Math.floor Math.random() * DIE_SIZE

emitEvents = (emitter, die1, die2) ->
  emitter.emit 'rolled double', die1 if die1 is die2

exports.roll = (emitter) ->
  die1 = roll()
  die2 = roll()
  emitEvents emitter, die1, die2 if emitter
  die1 + die2
