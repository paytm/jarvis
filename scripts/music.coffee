dom = require 'xmldom'
xpath = require 'xpath'
fs = require 'fs'
dom = dom.DOMParser
module.exports = (robot) ->
    robot.hear  /music (.*)/i, (res) ->
        groupName = res.envelope.room
        userName = res.envelope.user.name
        userid = res.envelope.user.id
        if groupName in ['random']
            musicLink = res.match[1]
            robot.http(musicLink)
                .get() (err, parseRes, parseBody) ->
                    if parseRes.statusCode isnt 200 or err
                        res.send "Failed to fetch information, Can you share a proper link with no redirects"
                        return
                    doc = new dom().parseFromString(parseBody)
                    nodes = xpath.select('//title', doc)
                    songName = nodes[0].firstChild.data
                    #res.reply songName
                    fileString = "• #{songName} by #{userName}\n"
                    replyMsg = "I have added your suggestion #{songName} to the list. Thanks!"
                    fs.appendFileSync('songs.md', fileString)
                    res.send(replyMsg)

        else
            sorryMsg = "I am sorry  <@#{userid}|#{userName}>! but I can only save your music once you join music channel"
            res.send(sorryMsg)
