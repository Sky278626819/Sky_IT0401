//
//  People.h
//  ITDemo001
//
//  Created by Mac on 16/3/24.
//  Copyright © 2016年 SKY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

@property (nonatomic,strong) NSString                    *name;
@property (nonatomic,unsafe_unretained) short                    age;
@property (nonatomic,unsafe_unretained) float                    w;
@property (nonatomic,unsafe_unretained) float                     h;

@end
