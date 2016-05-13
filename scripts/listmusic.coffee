# Description:
#   Hubot lists the music being saved on music channel
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot /listmusic Lists the links saved upto now from `songs.md` file
#
# Author:
#   staranjeet
#

fs = require 'fs'

module.exports = (robot) ->
  robot.hear /listmusic/i, (res) ->
      userid = res.envelope.user.id
      userName = res.envelope.user.name
      holdmsg = "Master <@#{userid}|#{userName}>!, just hold on for a sec, I will be back with the list "
      res.send(holdmsg)
      setTimeout(listcontent(res), 5000)

listcontent = (res) ->
    songList = fs.readFileSync("songs.md")
    songList = '```' + songList + '```'
    res.reply(songList)
