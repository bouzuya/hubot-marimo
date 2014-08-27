# Description
#   A Hubot script that display the marimo
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot marimo [<N>] - display the marimo
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  robot.respond /marimo(?:\s+(\d+))?\s*$/i, (res) ->
    count = parseInt (res.match[1] ? '1'), 10
    marimo = '●'
    s = ''
    while count > 0
      s += marimo
      count--
    res.send s
