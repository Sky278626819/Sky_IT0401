//
//  ProductView.m
//  ITDemo001
//
//  Created by Mac on 16/3/25.
//  Copyright © 2016年 SKY. All rights reserved.
//

#import "ProductView.h"
#import "People.h"

@interface ProductView () {
    
    UIImageView   *_pV1;
    UIImageView   *_pV2;
    UIImageView   *_pV3;
    UIImageView   *_pV4;
    
    UILabel               *_pInfo;
    
    UIButton             *_pSave;
    
}

@end



@implementation ProductView

- (void)dealloc {
    self.pModel = nil;
}

//instancetype加强版的id  包含九大基本类型
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        初始化视图
        
        [self initView];
        
    }
    return self;
}
- (void)initView {
    UIImageView *imagr1 = [[UIImageView alloc]initWithFrame:CGRectZero];
    UIImageView *imagr2 = [[UIImageView alloc]initWithFrame:CGRectZero];
    UIImageView *imagr3 = [[UIImageView alloc]initWithFrame:CGRectZero];
    UIImageView *imagr4 = [[UIImageView alloc]initWithFrame:CGRectZero];
    imagr1.backgroundColor = [UIColor greenColor];
    imagr2.backgroundColor = [UIColor purpleColor];
    imagr3.backgroundColor = [UIColor grayColor];
    imagr4.backgroundColor = [UIColor blueColor];
    
    [self addSubview:imagr1];
    [self addSubview:imagr2];
    [self addSubview:imagr3];
    [self addSubview:imagr4];
    
//    lable
    UILabel *l = [[UILabel alloc]initWithFrame:CGRectZero];
    l.text = @"";
    l.backgroundColor = [UIColor redColor];
    [self addSubview:l];
    
    
//    btn
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectZero;
    [btn addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor whiteColor];
    [self addSubview:btn];
    
    
    _pV1 = imagr1;
    _pV2 = imagr2;
    _pV3 = imagr3;
    _pV4 = imagr4;
    
    _pInfo = l;
    _pSave = btn;
    
    
    
}

- (void)save:(UIButton *)sender {
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    People *p = self.pModel;
    if (!p) {
        return;
    }
    
    int a = 1;
    switch (a) {
        case 1: {
            
            float  w = p.w;
            float  h = p.h;
            
            h = (self.bounds.size.width - 15)/w*h;
//            image
//            [_pV1.image ]  SDWebImage
            if (self.frame.origin.x !=0) {
                _pV1.frame = CGRectMake(5, 10, (self.bounds.size.width - 15), h);
                
                
                
                //            info
                _pInfo.text = p.name;
                _pInfo.frame = CGRectMake(5, 10+h+10, (self.bounds.size.width - 15), 30);
                
                //            btn
                _pSave.frame = CGRectMake(5, _pInfo.frame.origin.y + 30 + 10, 40, 30);
            }else {
            _pV1.frame = CGRectMake(10, 10, (self.bounds.size.width - 15), h);
            
            
            
//            info
            _pInfo.text = p.name;
            _pInfo.frame = CGRectMake(10, 10+h+10, (self.bounds.size.width - 15), 30);
            
//            btn
            _pSave.frame = CGRectMake(10, _pInfo.frame.origin.y + 30 + 10, 40, 30);
            
            
            }
            break;
        }
        default:
            break;
    }
    
    
}
















/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
