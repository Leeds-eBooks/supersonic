module.exports =
  steroids:
    schemaVersion: "2.0.0"

  app:
    name: "Supersonic testSpecApp"
    version: "0.1.0"

  # This config flag is enabled for testing the CORS-issue prevention in the native client.
  network:
    extraResponseHeaders:
      "Access-Control-Allow-Origin": "*"
      "Access-Control-Allow-Headers": "Content-Type, X-Requested-With, X-Job-Id, steroidsAppId, steroidsApiKey"

  splashscreen:
    autohide: true

  webView:
    viewsIgnoreStatusBar: false
    enableDoubleTapToFocus: false
    disableOverscroll: false
    enableViewportScale: false # kinda harmful?
    enablePopGestureRecognition: true
    allowInlineMediaPlayback: true
