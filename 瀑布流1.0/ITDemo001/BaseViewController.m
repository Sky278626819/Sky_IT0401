//
//  BaseViewController.m
//  ITDemo001
//
//  Created by Mac on 16/3/23.
//  Copyright © 2016年 SKY. All rights reserved.
//

#import "BaseViewController.h"
#import "Masonry.h"

@interface BaseViewController () {
//    1.5创建UI控件变量，以便修改
    UIButton *_lBtn;
    UIButton *_rBtn;
    UILabel *_titleL;
    UIImageView *_titleImage;
    
    UIView *_bgV;
    
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    1.1
    [self initBaseView];
}
#pragma mark- initBaseView
- (void)initBaseView {
    
    self.navigationController.navigationBarHidden = YES;
    
    UIView *bgView = [UIView new];
    [self.view addSubview:bgView];
    
    bgView.backgroundColor = [UIColor yellowColor];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(0);
        make.left.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.view).with.offset(0);
        make.height.mas_equalTo(@64);
    }];
    
//    1.4
    UIButton  *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn addTarget:self action:@selector(leftEvents:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
    UIButton  *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn addTarget:self action:@selector(rightEvents:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightBtn];
    
    UILabel *lable = [UILabel new];
    lable.text = @"";
    lable.font = [UIFont systemFontOfSize:18];
    lable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lable];
    
    UIImageView *imageView = [UIImageView new];
    [self.view addSubview:imageView];
    
    
//    1.6
    _lBtn = leftBtn;
    _rBtn = rightBtn;
    _titleL = lable;
    _titleImage = imageView;
    _bgV = bgView;
    
}
#pragma mark- 左右btn点击事件
- (void)leftEvents:(UIButton *)sender {
    
    NSLog(@"%s",__FUNCTION__);
}
- (void)rightEvents:(UIButton *)sender {
    
}
//1.2
//用id作为参数  不好 ，是灰常的不好，因为你连是什么类型的参数都不知道，让别人怎么使用？？？！！！
- (void)setAttribute:(NSString *)title withLeftStr:(NSString *)lStr withRightStr:(NSString *)rStr {
//    1.3
    if (!title && !lStr && !rStr) {
        return;
    }
//    1.7  中间
    if (title) {
        if ([title hasSuffix:@".png"]||[title hasSuffix:@".jpeg"]) {
            
//            如果是图片
            _titleImage.image = [UIImage imageNamed:title];
//            要对imageView做 适配
            [_titleImage mas_makeConstraints:^(MASConstraintMaker *make) {
//                适配
                
            }];
            
        }else {
            _titleL.text = title;
            _titleL.backgroundColor = [UIColor redColor];
            [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.centerX.mas_equalTo(@(self.view.bounds.size.width/2));
//                make.centerY.mas_equalTo(@(64/2 + 10));
                make.top.equalTo(self.view).with.offset(25);
                make.left.equalTo(self.view).with.offset(self.view.bounds.size.width/2-100);
                make.bottom.equalTo(_bgV.mas_bottom).with.offset(-5);
                make.size.mas_equalTo(CGSizeMake(200, 34));
            }];
            
        }
        
    }else {
        
    }
    
    if (lStr) {
        _lBtn.layer.backgroundColor = [UIColor redColor].CGColor;
//        如果是图片
        if ([lStr hasSuffix:@".png"] || [lStr hasSuffix:@".jpeg"]) {
            [_lBtn setImage:[UIImage imageNamed:lStr] forState:normal];
            [_lBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//                适配
                
            }];
        }else {
            [_lBtn setTitle:lStr forState:normal];
            [_lBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//                适配
                make.top.equalTo(self.view).with.offset(25);
                make.left.equalTo(self.view).with.offset(10);
                make.size.mas_equalTo(CGSizeMake(30, 34));
            }];
        }
        
        
    }
    
    if (rStr) {
        if ([rStr hasSuffix:@".png"] || [rStr hasSuffix:@".jpeg"]) {
//            如果是图片
            [_rBtn setImage:[UIImage imageNamed:rStr] forState:normal];
            [_rBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                
            }];
            
        }else {
//            如果是文字
            [_rBtn setTitle:rStr forState:normal];
            [_rBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//                适配
                
            }];
        }
        
        
    }
    
    
    
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
