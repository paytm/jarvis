# Description:
#   Hacker News
#
# Dependencies:
#   "nodepie": "0.7.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot hnews gets a random news from HN
#
# Author:
#   skimbrel
#   staranjeet
#
# Edits:
#   fetches only a single random news from hacker news
#   mentions the current group
#   error messages are not sent to the group

NodePie = require("nodepie")

hnFeedUrl = "https://news.ycombinator.com/rss"

module.exports = (robot) ->
    robot.on 'hnews:morning', (cb) ->
        robot.http(hnFeedUrl).get() (err, res, body) ->
            if res.statusCode is not 200
                console.log("Something's gone awry for hacker news feed")
            else
                feed = new NodePie(body)
                try
                    feed.init()
                catch e
                    console.log(e)
                noOfEntries = feed.getItemQuantity()
                idx = Math.floor(Math.random()*noOfEntries)
                try
                    item = feed.getItems()[idx]
                    linkToShare = item.getTitle() + ": " + item.getPermalink() + " (" + item.getComments()?.html + ")"
                    cb(linkToShare)
                catch e
                    console.log(e)
