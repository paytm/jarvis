module.exports = (robot) ->
    robot.hear /(http|https)/i, (res) ->
        groupName = res.envelope.room
        if groupName in ['music']
            #also check if the user has already used /music
            if res.envelope.message.text.indexOf('@jarvis /music') == -1
                userid = res.envelope.user.id
                userName = res.envelope.user.name
                promptMsg = "Hey <@#{userid}|#{userName}>!, Nothing to worry about. Just reminding you that if this is a music link, then you can save it to the list using /music <url>"
                res.send(promptMsg)
