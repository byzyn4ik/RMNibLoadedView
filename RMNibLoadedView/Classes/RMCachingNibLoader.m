//
//  RMCachingNibLoader.m
//  Pods
//
//  Created by pm on 02.09.16.
//
//

#import "RMCachingNibLoader.h"
#import "RMNibLoader.h"

@implementation RMCachingNibLoader

+ (NSMutableDictionary<NSString *, RMNibLoader *> *)nibLoaderCache {
   static dispatch_once_t onceToken;
   static NSMutableDictionary *nibLoaderCache;
   dispatch_once(&onceToken, ^{
      nibLoaderCache = [NSMutableDictionary dictionary];
   });
   return nibLoaderCache;
}

+ (RMNibLoader *)loaderForNibNamed:(NSString *)nibName
                           orClass:(Class)cls
                          inBundle:(NSBundle *)nibBundle {
   NSParameterAssert(nibName != nil || cls != nil);
   NSParameterAssert(nibBundle != nil);
   if (!nibName) {
      nibName = NSStringFromClass(cls);
   }
   RMNibLoader *loader = [[self nibLoaderCache] objectForKey:nibName];
   if (!loader) {
      loader = [[RMNibLoader alloc] initWithNibName:nibName bundle:nibBundle];
      [[self nibLoaderCache] setObject:loader forKey:nibName];
   }
   return loader;
}

+ (UIView *)loadViewFromNibNamed:(NSString *)nibName
                        inBundle:(NSBundle *)bundle
                         atIndex:(NSInteger)index
                         options:(NSDictionary *)options
                      loaderView:(UIView *)loaderView {
   RMNibLoader *loader = [self loaderForNibNamed:nibName
                                         orClass:[loaderView class]
                                        inBundle:bundle];
   UIView *nibView = [loader loadContentFromNibWithOwner:loaderView
                                        contentViewIndex:index
                                                 options:options];
   return nibView;
}

@end
