# Description:
#   Cron Scheduler
#   Emits a event at a random time from a fixed scheduled time
#
# Dependencies:
#   "cron": "1.1.0"
#
# Configuration:
#   None
#
# Commands:
#   none
#
# Author:
#   staranjeet
#
module.exports = (robot) ->
    cronJob = require('cron').CronJob
    tz = 'Asia/Kolkata'
    new cronJob '0 0 10 * * 1-5',
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
