//
//  RMNibLoader.h
//  Pods
//
//  Created by pm on 02.09.16.
//
//

#import <UIKit/UIKit.h>

@interface RMNibLoader : NSObject

@property(nonatomic, readonly) NSString *nibName;
@property(nonatomic, readonly) NSBundle *nibBundle;

- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle;
- (UIView *)loadContentFromNibWithOwner:(id)owner
                       contentViewIndex:(NSUInteger)contentViewIndex
                                options:(NSDictionary *)options;

@end
