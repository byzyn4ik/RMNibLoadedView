//
//  RMNibLoader.m
//  Pods
//
//  Created by pm on 02.09.16.
//
//

#import "RMNibLoader.h"
@interface RMNibLoader ()

@property (nonatomic, readonly) UINib *nib;

@end

@implementation RMNibLoader

@synthesize nib = _nib;

- (instancetype)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle
{
   NSParameterAssert(nibName != nil);
   NSParameterAssert(nibBundle != nil);

   if ((self = [super init])) {
      _nibName = nibName;
      _nibBundle = nibBundle;
   }
   return self;
}

- (UINib *)nib
{
   if (!_nib) {
      _nib = [UINib nibWithNibName:self.nibName bundle:self.nibBundle];
      if (!_nib) {
         NSString *reason = [NSString stringWithFormat:@"Nib file '%@' could not be loaded", self.nibName];
         @throw [NSException exceptionWithName:NSInvalidArgumentException reason:reason userInfo:nil];
      }
   }
   return _nib;
}

- (UIView *)loadContentFromNibWithOwner:(id)owner contentViewIndex:(NSUInteger)contentViewIndex options:(NSDictionary *)options
{
   NSArray *objects = [self.nib instantiateWithOwner:owner options:options];

   if (objects.count <= contentViewIndex || ![objects[contentViewIndex] isKindOfClass:[UIView class]]) {
      NSString *reason = [NSString stringWithFormat:@"Object at index %ld does not exist or is not a view", (unsigned long)contentViewIndex];
      @throw [NSException exceptionWithName:NSInvalidArgumentException reason:reason userInfo:nil];
   }
   return objects[contentViewIndex];
}

@end
