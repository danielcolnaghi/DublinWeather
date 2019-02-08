# Dublin Weather ☀️
Application that consumes the Open Weather Map API and show Dublin city forcast.


## Architecture
MVVM - https://cocoacasts.com/swift-and-model-view-viewmodel-in-practice/

## How to build and run 🔨
- Download the project from git.
- There is no third-party library like pods/carthage so you can go straight to project file and open.
- Configure your API key at https://openweathermap.org in the API class.
- This process can take time for the new accounts, you should receive an email with your key and it can take about one hour to  active the key.
- Change your certification team from DublinWeather target if build in device.
- Build & Run!

## Tests
There is a simple API test to validate if it is a Dublin City Forecast.

## Next steps
- Implement a 10 minutes cache from API.
- Improve UI experience with a better design and response from server.
- Add more unit tests from all classes/methods.

## Where to go
- With this implemantation is possible to change the API to build a forecast to another cities, maybe a list of cities that can be found here http://bulk.openweathermap.org/sample/
- Favourite list stored in the user defaults.
