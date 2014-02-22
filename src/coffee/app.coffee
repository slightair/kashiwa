World = require("./world")

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