module.exports =
  steroids:
    schemaVersion: "2.0.0"

  app:
    name: "Supersonic testSpecApp"
    version: "0.1.0"

  network:
    extraResponseHeaders:
      "Access-Control-Allow-Origin": "*"
      "Access-Control-Allow-Headers": "Content-Type, X-Requested-With, steroidsAppId, steroidsApiKey"

  splashscreen:
    autohide: true

  webView:
    viewsIgnoreStatusBar: false
    enableDoubleTapToFocus: false
    disableOverscroll: false
    enableViewportScale: false # kinda harmful?
    enablePopGestureRecognition: true
    allowInlineMediaPlayback: true
