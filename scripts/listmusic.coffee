fs = require 'fs'

module.exports = (robot) ->
  robot.hear /listmusic/i, (res) ->
      console.log(res)
      userid = res.envelope.user.id
      userName = res.envelope.user.name
      holdmsg = "Master <@#{userid}|#{userName}>!, just hold on for a sec, I will be back with the list "
      res.send(holdmsg)
      setTimeout(listcontent(res), 5000)
      #songList = fs.readFileSync("songs.md")
      #res.reply(songList)

listcontent = (res) ->
    songList = fs.readFileSync("songs.md")
    res.reply(songList)
