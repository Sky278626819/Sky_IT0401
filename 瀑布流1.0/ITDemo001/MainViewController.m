//
//  MainViewController.m
//  ITDemo001
//
//  Created by Mac on 16/3/23.
//  Copyright © 2016年 SKY. All rights reserved.
//

#import "MainViewController.h"
#import "People.h"
#import "ProductView.h"

#define WIDTH CGRectGetWidth([[UIScreen mainScreen] bounds])
#define HEIGHT CGRectGetHeight([[UIScreen mainScreen] bounds])


@interface MainViewController () {
    NSArray  *_dataArr;
    
//    声明列数   2列
    float  _colH[2];
    
    UIScrollView   *_scrollView;
    
    
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setAttribute:@"Main" withLeftStr:@"123" withRightStr:@"456"];
    
//    初始化列的高度
    _colH[0] = 0;
    _colH[1] = 0;
    
//    初始化数据
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    for (NSInteger i = 0; i < 100; i++) {
        People *p = [People new];
        p.name = [NSString stringWithFormat:@"name_%ld",i];
        p.age = arc4random()%60+18;
        p.w = arc4random()%300 + 200;
        p.h = arc4random()%400 + 200;
        [array addObject:p];
    }
    _dataArr = array;
    
//    初始化   UI
    [self initView];
    
//    瀑布流布局
    [self pullWaterView];
}
#pragma mark - 初始化UI
- (void)initView {
    
    UIScrollView *s = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    s.backgroundColor = [UIColor grayColor];
    [self.view addSubview:s];
    _scrollView = s;
}

- (void)pullWaterView {
    
    if (_dataArr.count != 0) {
        for (People *p in _dataArr) {
            NSInteger  index  =  _colH[0] < _colH[1]?0:1;
//            如果还有第三列
//            index = _colH[index] < _colH[2]?index:2;
            float  w = p.w;
            float  h  = p.h;
            
            h = (self.view.bounds.size.width/2 - 15)/w*h;
            h = h + 10 + 10 + 10 + 60;
            
            ProductView *bigView = [[ProductView alloc]initWithFrame:CGRectMake(index*WIDTH/2, _colH[index], WIDTH/2, h)];
            bigView.backgroundColor = [UIColor lightGrayColor];
            bigView.pModel = p;
            [_scrollView addSubview:bigView];
            _colH[index] += h;
        }
        
        float  maxH = _colH[0] > _colH[1]?_colH[0]:_colH[1];
        _scrollView.contentSize = CGSizeMake(0, maxH);
    }
    
    
    
}





- (void)leftEvents:(UIButton *)sender {
//    [super leftEvents:sender];  会调父类的方法
    NSLog(@"%s",__FUNCTION__);
}









@end
