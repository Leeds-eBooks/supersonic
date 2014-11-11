---
layout: docs_overview
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn how Supersonic utilizes streams
section_id: streams
---

# Streams

Most of the Supersonic APIs return a [promise](/overview/promises/)  and the response of the API call can then be achieved registering a callback to the promise. For some of the APIs (eg. those related to [geolocation, compass and accelerometer](/api-reference/stable/supersonic/device/)) Supersonic provides also alternative versions which return _streams_ that make it easy to track as a time series the values that the API returns.

In the following a stream of [compass headings](api-reference/stable/supersonic/device/compass/watchheading/) is created and a callback  that is called for each value is registered to the stream:

```js
compassStream = supersonic.device.compass.watchHeading()

compassStream.onValue (heading) ->
  supersonic.logger.log(
    """
    Magnetic heading: #{heading.magneticHeading}
    True heading: #{heading.trueHeading}
    Heading accuracy: #{heading.headingAccuracy}
    Timestamp: #{heading.timestamp}
    """
  )
```

Event streams that Supersonic returns can be manipulated (e.g. filtered, combined, ...) easily using Functional Reactive programming library [Bacon.js]((https://github.com/baconjs/bacon.js/)).

# Learn more about streams

 - [Bacon JS](https://github.com/baconjs/bacon.js/)

