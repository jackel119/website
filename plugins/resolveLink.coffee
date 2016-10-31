url = require 'url'

module.exports = (env, callback) ->
  env.helpers.resolveLink = (content, uri, baseUrl) ->
    ### Resolve *uri* relative to *content*, resolves using
        *baseUrl* if no matching content is found. ###
    uriParts = url.parse uri
    if uriParts.protocol
      # absolute uri
      return uri
    else if uriParts.hash is uri
      # internal anchor
      return uri
    else
      # search pathname in content tree relative to *content*
      nav = content.parent
      path = uriParts.pathname?.split('/') or []
      while path.length and nav?
        part = path.shift()
        if part == ''
          # uri begins with / go to contents root
          nav = nav.parent while nav.parent
        else if part == '..'
          nav = nav.parent
        else
          nav = nav[part]
      if nav?.getUrl?
        return nav.getUrl() + [uriParts.hash]
      return url.resolve baseUrl, uri

  callback()
