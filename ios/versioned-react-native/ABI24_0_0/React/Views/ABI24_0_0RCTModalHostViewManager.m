/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "ABI24_0_0RCTModalHostViewManager.h"

#import "ABI24_0_0RCTBridge.h"
#import "ABI24_0_0RCTModalHostView.h"
#import "ABI24_0_0RCTModalHostViewController.h"
#import "ABI24_0_0RCTModalManager.h"
#import "ABI24_0_0RCTShadowView.h"
#import "ABI24_0_0RCTUtils.h"

@implementation ABI24_0_0RCTConvert (ABI24_0_0RCTModalHostView)

ABI24_0_0RCT_ENUM_CONVERTER(UIModalPresentationStyle, (@{
  @"fullScreen": @(UIModalPresentationFullScreen),
#if !TARGET_OS_TV
  @"pageSheet": @(UIModalPresentationPageSheet),
  @"formSheet": @(UIModalPresentationFormSheet),
#endif
  @"overFullScreen": @(UIModalPresentationOverFullScreen),
}), UIModalPresentationFullScreen, integerValue)

@end

@interface ABI24_0_0RCTModalHostShadowView : ABI24_0_0RCTShadowView

@end

@implementation ABI24_0_0RCTModalHostShadowView

- (void)insertReactABI24_0_0Subview:(id<ABI24_0_0RCTComponent>)subview atIndex:(NSInteger)atIndex
{
  [super insertReactABI24_0_0Subview:subview atIndex:atIndex];
  if ([subview isKindOfClass:[ABI24_0_0RCTShadowView class]]) {
    ((ABI24_0_0RCTShadowView *)subview).size = ABI24_0_0RCTScreenSize();
  }
}

@end

@interface ABI24_0_0RCTModalHostViewManager () <ABI24_0_0RCTModalHostViewInteractor>

@end

@implementation ABI24_0_0RCTModalHostViewManager
{
  NSHashTable *_hostViews;
}

ABI24_0_0RCT_EXPORT_MODULE()

- (UIView *)view
{
  ABI24_0_0RCTModalHostView *view = [[ABI24_0_0RCTModalHostView alloc] initWithBridge:self.bridge];
  view.delegate = self;
  if (!_hostViews) {
    _hostViews = [NSHashTable weakObjectsHashTable];
  }
  [_hostViews addObject:view];
  return view;
}

- (void)presentModalHostView:(ABI24_0_0RCTModalHostView *)modalHostView withViewController:(ABI24_0_0RCTModalHostViewController *)viewController animated:(BOOL)animated
{
  dispatch_block_t completionBlock = ^{
    if (modalHostView.onShow) {
      modalHostView.onShow(nil);
    }
  };
  if (_presentationBlock) {
    _presentationBlock([modalHostView ReactABI24_0_0ViewController], viewController, animated, completionBlock);
  } else {
    [[modalHostView ReactABI24_0_0ViewController] presentViewController:viewController animated:animated completion:completionBlock];
  }
}

- (void)dismissModalHostView:(ABI24_0_0RCTModalHostView *)modalHostView withViewController:(ABI24_0_0RCTModalHostViewController *)viewController animated:(BOOL)animated
{
  dispatch_block_t completionBlock = ^{
    if (modalHostView.identifier) {
      [[self.bridge moduleForClass:[ABI24_0_0RCTModalManager class]] modalDismissed:modalHostView.identifier];
    }
  };
  if (_dismissalBlock) {
    _dismissalBlock([modalHostView ReactABI24_0_0ViewController], viewController, animated, completionBlock);
  } else {
    [viewController dismissViewControllerAnimated:animated completion:completionBlock];
  }
}


- (ABI24_0_0RCTShadowView *)shadowView
{
  return [ABI24_0_0RCTModalHostShadowView new];
}

- (void)invalidate
{
  for (ABI24_0_0RCTModalHostView *hostView in _hostViews) {
    [hostView invalidate];
  }
  [_hostViews removeAllObjects];
}

ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(animationType, NSString)
ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(presentationStyle, UIModalPresentationStyle)
ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(transparent, BOOL)
ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(onShow, ABI24_0_0RCTDirectEventBlock)
ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(identifier, NSNumber)
ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(supportedOrientations, NSArray)
ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(onOrientationChange, ABI24_0_0RCTDirectEventBlock)

#if TARGET_OS_TV
ABI24_0_0RCT_EXPORT_VIEW_PROPERTY(onRequestClose, ABI24_0_0RCTDirectEventBlock)
#endif

@end
