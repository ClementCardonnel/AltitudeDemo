# Altitude Demo

This is a quick showcase of CoreMotion CMAltimer's two methods for collecting altitude data: CMAboluteAltitudeData vs CMAltitudeData.

- `CMAltitudeData` is available on virtually every iOS device and is "relative". It uses the barometer of the iPhone to measure the difference in altitude between the initial measurement and the latest one.
- `CMAbsoluteAltitudeData` uses an improved sensor found on iPhone 12 and Apple Watch Series 6 and better. This new sensor allows for absolute altitude measurement. Meaning, your actual altitude relative to the sea level.

With this demo, I wanted to have a quick way to compre both technologies. I hope you enjoy!

![A screenshot of the project running on an iPhone 13 Pro. You can find two tabs, one for the relative altitudes, and another one for the absolute altitudes. There's also a play/pause button.](screenshot.PNG?raw=true)

## Setup

1. Clone the project
2. Add a team
3. Build and run on an iPhone 12 or better.

