module.exports = (robot) ->
    robot.respond /yoda for (.*)/i, (res) ->
        sentence = res.match[1]
        robot.http("https://yoda.p.mashape.com/yoda?sentence= "+sentence)
            .header('X-Mashape-Key',process.env.YODA_KEY)
            .get() (err, response, body) ->
                if response.statusCode isnt 200 or err
                    res.send "Sorry, Couldn't parse to Yoga Tongue"
                    return
                res.send body