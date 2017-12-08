// Copyright 2015-present 650 Industries. All rights reserved.

#import <ReactABI24_0_0/ABI24_0_0RCTBridgeModule.h>

FOUNDATION_EXPORT NSNotificationName ABI24_0_0EXTestSuiteCompletedNotification;

typedef enum ABI24_0_0EXTestEnvironment {
  ABI24_0_0EXTestEnvironmentNone = 0,
  ABI24_0_0EXTestEnvironmentLocal = 1,
  ABI24_0_0EXTestEnvironmentCI = 2,
} ABI24_0_0EXTestEnvironment;

@interface ABI24_0_0EXTest : NSObject <ABI24_0_0RCTBridgeModule>

- (instancetype)initWithEnvironment:(ABI24_0_0EXTestEnvironment)environment NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

+ (ABI24_0_0EXTestEnvironment)testEnvironmentFromString:(NSString *)testEnvironmentString;

@end
