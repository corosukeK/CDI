//
//  Sample_UserDefaultsService.m
//  Sample
//
//  Created by 木村圭佑 on 2014/06/02.
//  Copyright (c) 2014年 real-prometheus. All rights reserved.
//

#import "Sample_UserDefaultsService.h"

@singleton(Sample_UserDefaultsService)
@implementation Sample_UserDefaultsService

@UserDefaultsInject(sampleString,@"sampleStringKey",NSString)
@UserDefaultsInject(sampleInteger,@"sampleIntegerKey",NSInteger)
@UserDefaultsInject(sampleDate,@"sampleDateKey")

/** 下のみたいなのが生成される
- (NSString *)sampleString
{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    return [standardDefaults stringForKey:@"sampleStringKey"];
}

- (void)setSampleString:(NSString *)string
{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    [standardDefaults setObject:string forKey:@"sampleStringKey"];
    [standardDefaults synchronize];
}

- (NSDate *)sampleDate
{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSData *original = [standardDefaults dataForKey:@"sampleDate"];
    return [NSKeyedUnarchiver unarchiveObjectWithData:original];
}

- (void)setSampleDate:(NSDate *)date
{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    [standardDefaults setObject:date forKey:@"sampleDate"];
    [standardDefaults synchronize];
}
 
 */

@end
