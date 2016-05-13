# Description:
#   Bakar
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot introduce yourself -  introduces itself
#
# Author:
#   samarthmed
module.exports = (robot) ->

     robot.respond /introduce yourself/i , (res) ->
       res.reply ("J.A.R.V.I.S. is a very intelligent A.I. who can respond according to the users thoughts. He is kind, and is also understanding to anything, such as problems in Tony's life that he tries to deal and help him with. \n https://soundcloud.com/briantyler/iron-man-3-1#t=0:13")

     robot.respond /kamine/i , (res) ->
       res.reply ("Bhak Saale")
