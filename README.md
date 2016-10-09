# SeismiKit
SeismiKit is an iOS framework that can be used to retrieve earthquake data using publicly available data provided by USGS exposed by [Seismi's](http://www.seismi.org/) APIs.

## Installation using Cocopods
[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C. You can install it with the following command:

```bash
$ gem install cocoapods
```

##### Podfile
To integrate SeismiKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
platform :ios, '9.3'

target 'TargetName' do
    pod 'SeismiKit', :git => 'https://github.com/sangeetavishwanath/SeismiKit.git', :branch => 'master'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage
#### EarthquakesController
The `EarthquakesController` can be used to retrieve earthquakes data. Upon completion of the data retrieval it invokes the `earthquakesController:didRetrieveEarthquakes:` or the `earthquakesController: didFailToRetrieveEarthquakesWithError:` method of the `<EarthquakesControllerDelegate>`.

###### Example
```objc
EarthquakesController *controller = [[EarthquakesController alloc] init];
controller.delegate = self;
controller retrieveEarthquakes];

...

- (void)earthquakesController:(EarthquakesController *)controller didRetrieveEarthquakes:(NSArray<Earthquake *> *)earthquakes
{
    // Do something with the earthquake data.
}

- (void)earthquakesController:(EarthquakesController *)controller didFailToRetrieveEarthquakesWithError:(NSError *)error
{
    // Handle failure
}
```

## Architectural Notes
![Architecture](/Sketchboard/Architecture.png?raw=true "Architecture")

For the external world, the `EarthquakesController` is the interface to SeismiKit. The controller uses the `EarthquakesService` to fetch earthquakes data from Seismi's APIs.

The `EarthquakesService` uses Mantle to deserialise the JSON returned by the API to a `EarthquakesList`. The `EarthquakesController` conforms to the protocol `<EarthquakesServiceDelegate>` and is notified of the `EarthquakesList` or alternately, any error retrieving the earthquakes data via the `<EarthquakesServiceDelegate>` protocol.

The `EarthquakesController` itself communicates the earthquakes data via a `<EarthquakesControllerDelegate>` protocol. So a client that uses the `EarthquakesController` must define a delegate conforming to the `<EarthquakesControllerDelegate>` protocol

##### Improvements: Caching
The `EarthquakesController` currently just passes on the earthquakes data to the client. However, it can be enhanced to cache the data until the client issues a forced refresh call.

##### Improvements: Security
On the `AFHTTPSessionManager` used to make the API call, we set the following property:
```objc
sessionManager.securityPolicy.allowInvalidCertificates = YES;
```
This is insecure and not recommended for production. Instead, we should consider communication over HTTPS connections with SSL pinning enabled.

#### Improvements: Testing
1. Unit tests for `EarthquakesService`
2. Unit tests for `SessionService`
3. Unit tests for `SessionManagerFactory`
4. Integration tests using Nocilla

## Resources
1. [Objective Cat - Mantle](http://www.objc.at/mantle)
2. [NSValueTransformer](http://nshipster.com/nsvaluetransformer/)
3. [Creating a Cocoapod](http://lafosca.cat/create-a-cocoapods-of-your-library/)
