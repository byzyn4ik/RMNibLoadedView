//
//  RMCachingNibLoader.h
//  Pods
//
//  Created by pm on 02.09.16.
//
//

#import <UIKit/UIKit.h>

@interface RMCachingNibLoader : NSObject

+ (UIView *)loadViewFromNibNamed:(NSString *)nibName
                        inBundle:(NSBundle *)bundle
                         atIndex:(NSInteger)index
                         options:(NSDictionary *)options
                      loaderView:(UIView *)loaderView;

@end
