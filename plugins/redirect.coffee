# Based on https://github.com/jnordberg/wintersmith-redirect/blob/3b9de6a/src/index.coffee
# Copyright Johan Nordberg <code@johan-nordberg.com>
# Under MIT license

url = require 'url'

module.exports = (env, callback) ->

  class Redirect extends env.ContentPlugin
    constructor: (@from, config) ->
      if typeof config is 'string'
        target = config
        title = "Redirecting"
      else
        target = config['target']
        title = config['title']

      target = url.resolve env.config.baseUrl, target

      @response = new Buffer """
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <title>#{ title }</title>
            <meta http-equiv="refresh" content="2; url=#{ target }">
            <script type="text/javascript">window.location.href = "#{ target }"</script>
          </head>
        </html>
      """

    getFilename: -> @from + "/index.html"
    getView: -> (args..., callback) -> callback null, @response


  tree = {redirects: {}}
  for filename, redirect of env.config.redirects or {}
    tree.redirects[filename] = new Redirect filename, redirect

  env.registerGenerator 'redirects', (contents, callback) ->
    callback null, tree

  callback()
