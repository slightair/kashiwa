class World extends PIXI.DisplayObjectContainer
  constructor: (w, h) ->
    super

    @mushroom = new PIXI.Sprite(PIXI.Texture.fromImage("/img/mushroom.png"))
    @mushroom.anchor.x = 0.5
    @mushroom.anchor.y = 0.5
    @mushroom.position.x = w / 2
    @mushroom.position.y = h / 2

    @addChild(@mushroom)

  update: ->
    @mushroom.rotation -= 0.1

$ ->
  width = 640
  height = 480

  stage = new PIXI.Stage('black')
  renderer = PIXI.autoDetectRenderer(width, height)

  $('#world-view').append(renderer.view)

  world = new World(width, height)
  stage.addChild(world)

  animate = =>
    requestAnimationFrame(animate)

    world.update()

    renderer.render(stage)

  requestAnimationFrame(animate)