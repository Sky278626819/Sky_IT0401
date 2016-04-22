//
//  BaseViewController.h
//  ITDemo001
//
//  Created by Mac on 16/3/23.
//  Copyright © 2016年 SKY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)setAttribute:(NSString *)title withLeftStr:(NSString *)lStr withRightStr:(NSString *)rStr;
//
- (void)leftEvents:(UIButton *)sender;
- (void)rightEvents:(UIButton *)sender;
@end
