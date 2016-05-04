module.exports = (robot) ->
    # Random Poem
    robot.hear /Give me a poem/i, (res) ->
        #get all poets
        get_author_url =  "http://poetrydb.org/author"
        robot.http(get_author_url)
            .get() (errors, response, body) ->
                if response.statusCode isnt 200 or errors
                    res.send "Sorry, Couldn't fetch the Poem"
                    return
                data = null
                try
                    data = JSON.parse body
                catch parseError
                    res.send "Sorry, Couldn't fetch the Poem.Third part API error."
                    return

                poets = data.authors

                #pick a random poet
                poet = poets[Math.floor(Math.random() * poets.length)]

                #get all titles by the author
                get_title_by_author_url = "http://poetrydb.org/author/" + poet + "/title"

                robot.http(get_title_by_author_url)
                    .get() (errors1,response1,body1) ->
                        if response1.statusCode isnt 200 or errors1
                            res.send "Sorry, Couldn't fetch the Poem"
                            return
                        data1 = null

                        try
                            data1 = JSON.parse body1
                        catch parseError
                            res.send "Sorry, Couldn't fetch the Poem.Third part API error."
                            return

                        #Pick a random title
                        title = data1[Math.floor(Math.random() * data1.length)].title

                        #Alas Time to get the poem
                        poem_url = "http://poetrydb.org/author,title/" + poet + ";" + title
                        robot.http(poem_url)
                            .get() (errors2, response2, body2) ->
                                if response2.statusCode isnt 200 or errors2
                                    res.send "Sorry, Couldn't fetch the Poem"
                                    return
                                poem_data = null
                                try
                                    poem_data = JSON.parse body2
                                catch parseError
                                    res.send "Sorry, Couldn't fetch the Poem.Third part API error."
                                    return
                                poem_lines = "\"" + title + "\"  - by \"" + poet + "\"\n\n"
                                for i in [0...poem_data[0].lines.length]
                                    poem_lines += poem_data[0].lines[i] + "\n"
                                res.send poem_lines
                                return