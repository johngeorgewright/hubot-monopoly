chai = require 'chai'
sinon = require 'sinon'
player = require '../src/lib/player'
dice = require '../src/lib/dice'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'player', ->
  beforeEach ->
    @player = new player 'John'

  describe 'constructor()', ->
    it 'will set the given name', ->
      expect(@player).to.have.property 'name', 'John'

    it 'will set the starting position', ->
      expect(@player).to.have.property 'position', 0

    it 'will set an empty deeds array', ->
      expect(@player.deeds).to.be.instanceOf Array
      expect(@player.deeds).to.be.empty

    it 'will set an empty array of property', ->
      expect(@player.property).to.be.instanceOf Array
      expect(@player.property).to.be.empty

    it 'will give the player some money', ->
      expect(@player).to.have.property 'money', 1500

  describe 'roll()', ->
    beforeEach ->
      @roll = dice.roll
      dice.roll = sinon.spy()

    afterEach ->
      dice.roll = @roll

    it 'will roll the dice', ->
      @player.roll()
      expect(dice.roll).to.have.been.calledOnce

  describe 'buyProperty()', ->
    beforeEach ->
      @player.deeds.push street: 'mung'
      @player.buyProperty street: 'mung', price: 10

    it 'will remove the money if the player has it', ->
      expect(@player.money).to.equal 1490

    it 'will add the property to the player\'s property array ', ->
      expect(@player.property).to.have.length 1
      expect(@player.property[0]).to.eql street: 'mung', price: 10

    it 'will throw an error if the player doesn\'t have the deed', ->
      expect(=> @player.buyProperty street: 'face').to.throw()
