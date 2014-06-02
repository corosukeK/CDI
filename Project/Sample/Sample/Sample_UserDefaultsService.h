//
//  Sample_UserDefaultsService.h
//  Sample
//
//  Created by 木村圭佑 on 2014/06/02.
//  Copyright (c) 2014年 real-prometheus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CDISingleton.h>
#import <CDIUserDefaultsInjector.h>

@interface Sample_UserDefaultsService : NSObject

@property (nonatomic) NSString *sampleString;
@property (nonatomic) NSInteger sampleInteger;
@property (nonatomic) NSDate *sampleDate;

@end
