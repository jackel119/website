_ = require('underscore')

module.exports = (env, callback) ->
  env.helpers.getChronologicalList = (contents, folder, reverse) ->
    # enumerate each contents/subdirectory/index(.md) file
    dirs = _.chain(contents[folder]._.directories).map((item) -> item.index).value()

    # enumerate each contents/file(.md) file
    files = contents[folder]._.pages

    # combine dirs and files object lists
    items = _(_.union(dirs, files)).sortBy (item) ->
      if reverse
        -item.date
      else
        item.date

    return items

  callback()
