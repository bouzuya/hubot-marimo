// Description
//   A Hubot script that display the marimo
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   hubot marimo [<N>] - display the marimo
//
// Author:
//   bouzuya <m@bouzuya.net>
//
module.exports = function(robot) {
  return robot.respond(/marimo(?:\s+(\d+))?\s*$/i, function(res) {
    var count, marimo, s, _ref;
    count = parseInt((_ref = res.match[1]) != null ? _ref : '1', 10);
    marimo = '●';
    s = '';
    while (count > 0) {
      s += marimo;
      count--;
    }
    return res.send(s);
  });
};
