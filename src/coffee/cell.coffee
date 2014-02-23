class Cell extends PIXI.DisplayObjectContainer
  constructor: (@width, @height) ->
    super

    background = PIXI.Sprite.fromFrame "grass1.png"
    @addChild background

    mushroomIndex = Math.floor(Math.random() * 6) + 1
    @mushroom = PIXI.Sprite.fromFrame "mushroom#{mushroomIndex}.png"
    @mushroom.anchor.x = 0.5
    @mushroom.anchor.y = 0.5
    @mushroom.position.x = @width / 2
    @mushroom.position.y = @height / 2

    @addChild @mushroom

  update: ->

module.exports = Cell