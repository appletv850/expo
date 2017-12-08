#import <CoreMotion/CoreMotion.h>
#import <ReactABI24_0_0/ABI24_0_0RCTBridge.h>
#import "ABI24_0_0EXScopedEventEmitter.h"

@protocol ABI24_0_0EXAccelerometerScopedModuleDelegate

- (void)sensorModuleDidSubscribeForAccelerometerUpdates:(id)scopedSensorModule withHandler:(void (^)(NSDictionary *event))handlerBlock;
- (void)sensorModuleDidUnsubscribeForAccelerometerUpdates:(id)scopedSensorModule;
- (void)setAccelerometerUpdateInterval:(NSTimeInterval)intervalMs;

@end

@interface ABI24_0_0EXAccelerometer : ABI24_0_0EXScopedEventEmitter

@end
