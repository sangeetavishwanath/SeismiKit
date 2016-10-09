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

#import "EarthquakesController.h"
#import "EarthquakesService.h"

SpecBegin(EarthquakesControllerTests)

describe(@"EarthquakesController", ^{

    __block EarthquakesController *controller;
    __block EarthquakesService *service;

    beforeAll(^{
        service = mock(EarthquakesService.class);
        controller = [[EarthquakesController alloc] initWithService:service];
    });

    describe(@"retrieveEarthquakes", ^{

        it(@"must ask the service to retrieve earthquakes", ^{
            [controller retrieveEarthquakes];
            [verifyCount(service, times(1)) retrieveEarthquakes];
        });
    });
});

SpecEnd

