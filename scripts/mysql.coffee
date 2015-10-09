mysql = require 'mysql'
table = require 'cli-table'

connection = mysql.createConnection
  host: '#'
  user: '#'
  database: '#'
  password: '#'


module.exports = (robot) ->

  robot.hear /run query (.*)/i , (res) ->
    query = res.match[1]
    query = mysql.format(query)
    connection.query query , (err, result) ->
      res.send err.message if (err)
      headers = []

      return res.send "Today is just not your day" if result.length is 0

      for key in Object.keys result[0]
        headers.push(key)

      result_table = new table({head: headers , colWidhts : [100, 200],
      style: {head:[], border:[],'padding-left':1, 'padding-right': 1 }})

      for row in result
        table_row = []
        for header in headers
          table_row.push row[header]
        result_table.push table_row
        
      res.send result_table.toString()
