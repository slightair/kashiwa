class Cell extends PIXI.DisplayObjectContainer
  STATUS =
    NONE: 1
    EMERGING: 2
    EMERGED: 3

  constructor: (@width, @height) ->
    super

    background = PIXI.Sprite.fromFrame "grass1.png"
    @addChild background

    @status = STATUS.NONE

    @interactive = true

  update: ->
    switch @status
      when STATUS.NONE
        @spawn() if Math.random() < 0.001
      when STATUS.EMERGING
        @grow()

  click: (interactionData) ->
    @crop() if @status == STATUS.EMERGED

  spawn: ->
    mushroomIndex = Math.floor(Math.random() * 6) + 1
    @mushroom = PIXI.Sprite.fromFrame "mushroom#{mushroomIndex}.png"
    @mushroom.anchor.x = 0.5
    @mushroom.anchor.y = 0.5
    @mushroom.position.x = @width / 2
    @mushroom.position.y = @height / 2

    @mushroom.scale = new PIXI.Point(0, 0)

    @addChild @mushroom

    @status = STATUS.EMERGING

  grow: ->
    @mushroom.scale.x += 0.05
    @mushroom.scale.y += 0.05

    @status = STATUS.EMERGED if @mushroom.scale.x >= 1.0

  crop: ->
    @status = STATUS.NONE
    @removeChild @mushroom
    @mushroom = null

module.exports = Cell