rewire = require 'rewire'
chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'
dice = rewire '../src/lib/dice'
{EventEmitter} = require 'events'

expect = chai.expect

describe 'dice', ->
  beforeEach ->
    @emitter = new EventEmitter
    @revertEmitter = dice.__set__ 'emitter', @emitter

  afterEach ->
    @revertEmitter()

  describe 'roll()', ->
    beforeEach ->
      sinon.stub @emitter, 'emit'

    afterEach ->
      @emitter.emit.restore()

    it 'will return a number within 2 - 12', ->
      expect(dice.roll()).to.be.within 2, 12 for i in [0..100]

    it 'will emit the "double" event when a double is rolled', ->
      user = sinon.spy()
      dice.__with__(roll: -> 2) =>
        dice.roll user
        expect(@emitter.emit)
          .to.have.been.calledWithExactly 'rolled double', user, 2

  describe 'onDouble()', ->
    beforeEach ->
      @spy = sinon.spy()
      @user = sinon.spy()

    it 'will add an observer to the "double" event', ->
      dice.onDouble @spy
      @emitter.emit 'rolled double', @user, 2
      expect(@spy).to.have.been.calledWith @user, 2

  describe 'onceDouble()', ->
    beforeEach ->
      @spy = sinon.spy()
      @user = sinon.spy()

    it 'will add a singular observer to the "double" event', ->
      dice.onceDouble @spy
      @emitter.emit 'rolled double', @user, 2
      @emitter.emit 'rolled double', @user, 2
      expect(@spy).to.have.been.calledOnce
      expect(@spy).to.have.been.calledWith @user, 2
