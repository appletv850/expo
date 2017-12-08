// Copyright 2004-present Facebook. All Rights Reserved.

#import "ABI24_0_0RCTWrapperExampleView.h"

#import <ABI24_0_0RCTWrapper/ABI24_0_0RCTWrapper.h>

@implementation ABI24_0_0RCTWrapperExampleView {
  NSTimer *_timer;
  CGSize _intrinsicContentSize;
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    self.backgroundColor = [UIColor whiteColor];

    _intrinsicContentSize = CGSizeMake(64, 64);
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                              target:self
                                            selector:@selector(tick)
                                            userInfo:nil
                                             repeats:YES];

    UITapGestureRecognizer *gestureRecognizer =
      [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tick)];
    [self addGestureRecognizer:gestureRecognizer];
  }
  return self;
}

- (void)tick
{
  _intrinsicContentSize.width = 32 + arc4random() % 128;
  _intrinsicContentSize.height = 32 + arc4random() % 128;

  [self invalidateIntrinsicContentSize];
  [self.superview setNeedsLayout];
}

- (CGSize)intrinsicContentSize
{
  return _intrinsicContentSize;
}

- (CGSize)sizeThatFits:(CGSize)size
{
  return CGSizeMake(
    MIN(size.width, _intrinsicContentSize.width),
    MIN(size.height, _intrinsicContentSize.height)
  );
}

@end

ABI24_0_0RCT_WRAPPER_FOR_VIEW(ABI24_0_0RCTWrapperExampleView)
