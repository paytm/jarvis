dom = require 'xmldom'
xpath = require 'xpath'
fs = require 'fs'
dom = dom.DOMParser
module.exports = (robot) ->
    robot.hear  /music (.*)/i, (res) ->
        musicLink = res.match[1]
        userName = res.envelope.user.name
        robot.http(musicLink)
            .get() (err, parseRes, parseBody) ->
                if parseRes.statusCode isnt 200 or err
                    res.send "Failed to fetch information, Can you share a proper link with no redirects"
                    return
                doc = new dom().parseFromString(parseBody)
                nodes = xpath.select('//title', doc)
                songName = nodes[0].firstChild.data
                res.reply songName
                fileString = "• #{songName} by #{userName}\n"
                fs.appendFileSync('songs.md', fileString)
                res.send('Song successfully written to file')


        res.reply "Thanks for the suggestion"
