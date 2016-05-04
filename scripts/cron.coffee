module.exports = (robot) ->
    cronJob = require('cron').CronJob
    tz = 'Asia/Kolkata'
    new cronJob '0 * 10 * * *',
                        ->
                            noOfMins = 60
                            promptAt = Math.floor(Math.random()*noOfMins)
                            console.log(new Date(), promptAt, 'for hackernews')
                            setTimeout ( ->
                                robot.emit "hnews:morning", (msg) ->
                                    robot.messageRoom '#general', msg
                                ), promptAt*60*1000
                        null
                        true
                        tz
