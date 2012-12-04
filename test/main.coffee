yolo = require '../'
should = require 'should'
require 'mocha'

describe 'yolo', ->
  describe 'identify()', ->
    it 'should work', (done) ->
      a = {}
      b = {}
      ia = yolo.identify a
      ia2 = yolo.identify a
      ib = yolo.identify b
      ib2 = yolo.identify b

      should.exist ia
      should.exist ia2
      should.exist ib
      should.exist ib2
      ia.should.not.equal ib
      ia2.should.equal ia
      ib2.should.equal ib
      done()

  describe 'sizeof()', ->
    it 'should work', (done) ->
      a = {}
      b = test: 2
      ia = yolo.sizeof a
      ia2 = yolo.sizeof a
      ib = yolo.sizeof b
      ib2 = yolo.sizeof b

      should.exist ia
      should.exist ia2
      should.exist ib
      should.exist ib2
      ia.should.not.equal ib
      ia2.should.equal ia
      ib2.should.equal ib
      done()

  describe 'yolo()', ->
    it 'should work', (done) ->
      a = wat: 2
      yolo a
      process.nextTick ->
        should.not.exist a.wat
        done()