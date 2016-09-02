//
//  RMNibLoadedView.m
//  Pods
//
//  Created by pm on 02.09.16.
//
//

#import "RMNibLoadedView.h"
#import "RMCachingNibLoader.h"

@interface RMNibLoadedView ()

@property(nonatomic, weak) UIView *nibView;
@property(nonatomic) BOOL changed;

@end

@implementation RMNibLoadedView

- (instancetype)initWithFrame:(CGRect)frame
                      nibName:(NSString *)nibName
                 nibViewIndex:(NSInteger)nibViewIndex
                     inBundle:(NSBundle *)bundle
                      options:(NSDictionary *)options {
   self = [self initWithFrame:frame];
   if (self) {
      self.nibName = nibName;
      self.nibViewIndex = nibViewIndex;
      self.nibBundle = bundle;
      self.nibOptions = options;
      [self reloadNibView];
   }
   return self;
}


- (void)prepareForInterfaceBuilder {
   [super prepareForInterfaceBuilder];
   [self reloadNibView];
}

- (void)awakeFromNib {
   [self reloadNibView];
}

- (void)setNibView:(UIView *)nibView {
   if (_nibView) {
      [_nibView removeFromSuperview];
   }
   _nibView = nibView;
}

- (void)commonInit {
   [self reloadNibView];
}

- (void)setNibViewIndex:(NSInteger)nibViewIndex {
   _nibViewIndex = nibViewIndex;
   self.changed = YES;
   [self reloadNibView];
}

- (void)setNibName:(NSString *)nibName {
   _nibName = nibName;
   self.changed = YES;
   [self reloadNibView];
}

- (NSBundle *)nibBundle {
   if (!_nibBundle) {
      _nibBundle = [NSBundle bundleForClass:self.class];
   }
   return _nibBundle;
}

- (void)reloadNibView {
   if (self.changed) {
      UIView *nibView = [RMCachingNibLoader loadViewFromNibNamed:self.nibName
                                                        inBundle:self.nibBundle
                                                         atIndex:self.nibViewIndex
                                                         options:self.nibOptions
                                                      loaderView:self];
      nibView.frame = self.bounds;
      nibView.translatesAutoresizingMaskIntoConstraints = YES;
      nibView.autoresizingMask =
      (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
      [self addSubview:nibView];
      self.nibView = nibView;
      self.changed = NO;
   }

}

@end
