//
//  EarthquakesControllerSpec.m
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

#import <SeismiKit/SeismiKit.h>
#import "EarthquakesService.h"

@interface EarthquakesController ()

- (void)earthquakesService:(EarthquakesService *)service didRetrieveEarthquakes:(EarthquakesList *)earthquakeList;
- (void)earthquakesService:(EarthquakesService *)service didFailToRetrieveEarthquakesWithError:(NSError *)error;

@end

SpecBegin(EarthquakesControllerTests)

describe(@"EarthquakesController", ^{

    __block EarthquakesController *controller;
    __block EarthquakesService *service;
    __block id<EarthquakesControllerDelegate> delegate;

    beforeAll(^{
        service = mock(EarthquakesService.class);
        controller = [[EarthquakesController alloc] initWithService:service];
        delegate = mockProtocol(@protocol(EarthquakesControllerDelegate));
        controller.delegate = delegate;
    });

    describe(@"retrieveEarthquakes", ^{

        it(@"must ask the service to retrieve earthquakes", ^{
            [controller retrieveEarthquakes];
            [verifyCount(service, times(1)) retrieveEarthquakes];
        });
    });

    describe(@"earthquakesService:didRetrieveEarthquakes:", ^{

        __block EarthquakesList *earthquakesList;
        __block NSArray<Earthquake *> *earthquakes;

        before(^{
            earthquakesList = mock(EarthquakesList.class);
            earthquakes = mock(NSArray.class);
            [given([earthquakesList earthquakes]) willReturn:earthquakes];
        });

        it(@"must notify the delegate that earthquakes were retrieved", ^{
            [controller earthquakesService:service didRetrieveEarthquakes:earthquakesList];
            [verifyCount(delegate, times(1)) earthquakesController:controller didRetrieveEarthquakes:earthquakes];
        });
    });

    describe(@"earthquakesService:didFailToRetrieveEarthquakesWithError:", ^{

        __block NSError *error;

        before(^{
            error = mock(NSError.class);
        });

        it(@"must notify the delegate that earthquakes were retrieved", ^{
            [controller earthquakesService:service didFailToRetrieveEarthquakesWithError:error];
            [verifyCount(delegate, times(1)) earthquakesController:controller didFailToRetrieveEarthquakesWithError:error];
        });
    });

});

SpecEnd

