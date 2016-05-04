module.exports = (robot) ->
    robot.respond /define (.*)/i, (res) ->
        word = res.match[1]
        dictionary_endpoint = "http://api.wordnik.com/v4/word.json/" + word + "/definitions?"
        dictionary_options  = "limit=1&includeRelated=true&useCanonical=false&includeTags=false&api_key=" + process.env.DICTIONARY_KEY
        dictionary_url      = dictionary_endpoint + dictionary_options
        robot.http(dictionary_url)
            .get() (err, response, body) ->
                if response.statusCode isnt 200 or err
                    res.send "Sorry, Couldn't define " + word
                    return
                data = null
                try
                    data = JSON.parse body
                    data = data[0].text
                catch parseError
                    res.send "Sorry, Couldn't define " + word
                    return
                res.send word + " - " + data