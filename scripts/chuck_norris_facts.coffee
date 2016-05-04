fs = require 'fs'
config = './scripts/chuck_norris_facts.txt'

#random chuck norris fact
module.exports = (robot) ->
    opening = "Interesting Chuck Norris Fact : "
    robot.hear /chuck/i, (res) ->
        data = fs.readFileSync config, 'utf8'
        data = data.split('%')
        res.send opening + data[Math.floor(Math.random() * data.length)]
