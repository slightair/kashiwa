$ ->
  width = 640
  height = 480

  stage = new PIXI.Stage('black')
  renderer = PIXI.autoDetectRenderer(width, height)

  $('#world-view').append(renderer.view)

  mushroom = new PIXI.Sprite(PIXI.Texture.fromImage("/img/mushroom.png"))
  mushroom.anchor.x = 0.5
  mushroom.anchor.y = 0.5
  mushroom.position.x = width / 2
  mushroom.position.y = height / 2

  stage.addChild(mushroom)

  animate = ->
    requestAnimationFrame(animate)

    mushroom.rotation += 0.1

    renderer.render(stage)

  requestAnimationFrame(animate)