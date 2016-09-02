//
//  RMNibLoadedView.h
//  Pods
//
//  Created by pm on 02.09.16.
//
//

#import <UIKit/UIKit.h>

#if !COCOAPODS
#IB_DESIGNABLE
#endif

@interface RMNibLoadedView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                      nibName:(NSString *)nibName
                 nibViewIndex:(NSInteger)nibViewIndex
                     inBundle:(NSBundle *)bundle
                      options:(NSDictionary *)options;

@property(nonatomic, strong) IBInspectable NSString *nibName;
@property(nonatomic) IBInspectable NSInteger nibViewIndex;
@property(nonatomic, strong) NSBundle *nibBundle;
@property(nonatomic, strong) NSDictionary *nibOptions;

@end
