/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "ABI24_0_0RCTTabBarManager.h"

#import "ABI24_0_0RCTBridge.h"
#import "ABI24_0_0RCTTabBar.h"

@implementation ABI24_0_0RCTConvert (UITabBar)

ABI24_0_0RCT_ENUM_CONVERTER(UITabBarItemPositioning, (@{
  @"fill" : @(UITabBarItemPositioningFill),
  @"auto" : @(UITabBarItemPositioningAutomatic),
  @"center" : @(UITabBarItemPositioningCentered)
}), UITabBarItemPositioningAutomatic, integerValue)

@end

@implementation ABI24_0_0RCTTabBarManager

ABI24_0_0RCT_EXPORT_MODULE()

- (UIView *)view
{
  return [ABI24_0_0RCTTabBar new];
}

ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(unselectedTintColor, UIColor)
ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(tintColor, UIColor)
ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(barTintColor, UIColor)
ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(translucent, BOOL)
#if !TARGET_OS_TV
ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(barStyle, UIBarStyle)
#endif
ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(itemPositioning, UITabBarItemPositioning)
ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(unselectedItemTintColor, UIColor)

@end
