# Running locally:

Install [node.js](http://nodejs.org), clone this repo and run

    $ make
    $ make preview

Then open [http://localhost:8080](http://localhost:8080) 

# How do i add ?
## A new sponsor
Add a new entry in [`sponsors.json`](contents/data/sponsors.json). 

## A new redirection
Add a new entry in [`config.json`](config.json).

## A new event
- Create a new folder in [`contents/events`](contents/events), with the name `YYYY-MM-IDENTIFIER`.
- Create a file `index.md` in that folder, and add a banner image to the folder
- Add metadata and a short description to `index.md`, based on the following example :
```
---
title: "Phishing for Fun & Profit"
date: 2016-11-01 18:00
location: RSM G01
image: banner.jpg
sponsor_logo: /img/sponsors/netcraft_logo.png
url: https://www.facebook.com/events/727056880778601/
---
Short description comes here.

This is only used to display outside of labs, so limit it to 2-3 sentences
```

## A new post

Posts should be written in [Markdown](http://daringfireball.net/projects/markdown/syntax).

They're parsed with [marked](https://github.com/chjj/marked)

### Naming

- Create a folder in `contents/articles` with the structure `YYYY-MM-DD-IDENTIFIER`
- Create a file index.md in that folder
- Add any images etc in that folder too

See existing posts for examples, like [this one](contents/articles/2013-11-19-amazon-office-visit)

### Post contents:

- At the top, add metadata:

      ```
      ---
      title: Silicon Valley Comes to Imperial # Title of article
      author: DoCSoc                          # Must match author name - see below
      date: 2011-11-06 10:00                  # Get it right! Shows up on article
      template: article.jade                  # In general, don't change
      ---
      ```

- Ensure you have an "author" record.
    - In `contents/_authors` add a file `My Name.json`
    - Inside the file, add your name, a URL to a photo (gravatars are good) and a URL to your personal site (optional).
      For an example, see [Pete Hamilton's author file](contents/_authors/Pete%20Hamilton.json)

## Deployment

Website is deployed automatically by Netlify.

Pushing to the GitHub repository will take care of deployment automagically.
