{Robot, User, TextMessage} = require 'hubot'
assert = require 'power-assert'
path = require 'path'
sinon = require 'sinon'

describe 'marimo', ->
  beforeEach (done) ->
    @sinon = sinon.sandbox.create()
    # for warning: possible EventEmitter memory leak detected.
    # process.on 'uncaughtException'
    @sinon.stub process, 'on', -> null
    @robot = new Robot(path.resolve(__dirname, '..'), 'shell', false, 'hubot')
    @robot.adapter.on 'connected', =>
      @robot.load path.resolve(__dirname, '../../src/scripts')
      done()
    @robot.run()

  afterEach (done) ->
    @robot.brain.on 'close', =>
      @sinon.restore()
      done()
    @robot.shutdown()

  describe 'listeners[0].regex', ->
    beforeEach ->
      @sender = new User 'bouzuya', room: 'hitoridokusho'
      @callback = @sinon.spy()
      @robot.listeners[0].callback = @callback

    describe 'receive "@hubot marimo"', ->
      beforeEach ->
        message = '@hubot marimo'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'matches', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is '@hubot marimo'
        assert match[1] is undefined

    describe 'receive "@hubot marimo 3"', ->
      beforeEach ->
        message = '@hubot marimo 3'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'matches', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is '@hubot marimo 3'
        assert match[1] is '3'

  describe 'listeners[0].callback', ->
    beforeEach ->
      @hello = @robot.listeners[0].callback

    describe 'receive "@hubot marimo"', ->
      beforeEach ->
        @send = @sinon.spy()
        @hello
          match: ['@hubot marimo']
          send: @send

      it 'send "●"', ->
        assert @send.callCount is 1
        assert @send.firstCall.args[0] is '●'

    describe 'receive "@hubot marimo 3"', ->
      beforeEach ->
        @send = @sinon.spy()
        @hello
          match: ['@hubot marimo 3', '3']
          send: @send

      it 'send "●●●"', ->
        assert @send.callCount is 1
        assert @send.firstCall.args[0] is '●●●'
