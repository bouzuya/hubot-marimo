# hubot-marimo

A Hubot script that display the marimo.

## Installation

    $ npm install git://github.com/bouzuya/hubot-marimo.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-marimo.git#TAG'

## Example

    bouzuya> hubot help marimo
      hubot> hubot marimo [<N>] - display the marimo

    bouzuya> hubot marimo
      hubot> ●
    bouzuya> hubot marimo 5
      hubot> ●●●●●

## Configuration

See [`src/scripts/marimo.coffee`](src/scripts/marimo.coffee).

## Development

### Run test

    $ npm test

### Run robot

    $ npm run robot

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][mail]&gt; ([http://bouzuya.net][url])

## Badges

[![Build Status][travis-badge]][travis]
[![Dependencies status][david-dm-badge]][david-dm]

[travis]: https://travis-ci.org/bouzuya/hubot-marimo
[travis-badge]: https://travis-ci.org/bouzuya/hubot-marimo.svg?branch=master
[david-dm]: https://david-dm.org/bouzuya/hubot-marimo
[david-dm-badge]: https://david-dm.org/bouzuya/hubot-marimo.png
[user]: https://github.com/bouzuya
[mail]: mailto:m@bouzuya.net
[url]: http://bouzuya.net
