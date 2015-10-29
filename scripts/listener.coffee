module.exports = (robot) ->
  messages = [
    "You know nothing slackbot",
    "you so dumb , if you were a person , we would still call you a bot."
    "http://img.pandawhale.com/60981-Quadruple-Facepalm-meme-V9jF.jpeg",
    "http://cdn23.us1.fansshare.com/photos/meme/epic-facepalm-funny-meme-funny-823317954.jpg"
    "https://s-media-cache-ak0.pinimg.com/736x/97/5c/59/975c59692943cb30e51f293bf087a528.jpg"
  ]

  robot.listen(
    (message) -> # Match function
      message.user.name is "slackbot"
    (response) -> 
      response.reply messages[Math.floor(Math.random()*messages.length)]
  )
