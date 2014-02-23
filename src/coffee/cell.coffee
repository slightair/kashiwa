class Cell extends PIXI.Graphics
  constructor: (@width, @height) ->
    super

    @padding = 2
    @drawBackground()

    @mushroom = new PIXI.Sprite(PIXI.Texture.fromImage("/img/mushroom.png"))
    @mushroom.anchor.x = 0.5
    @mushroom.anchor.y = 0.5
    @mushroom.position.x = @width / 2
    @mushroom.position.y = @height / 2

    @addChild @mushroom

  drawBackground: ->
    @beginFill(0xFF0000, 1.0)
    @drawRect(@padding, @padding, @width - @padding * 2, @height - @padding * 2)
    @endFill()

  update: ->

module.exports = Cell