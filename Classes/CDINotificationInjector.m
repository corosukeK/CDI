//
//  CDINotificationInjector.m
//  Pods
//
//  Created by 木村圭佑 on 2014/06/06.
//
//

#import "CDINotificationInjector.h"

@implementation CDINotificationInjector

+ (void)addObserver:(id)object selectorName:(NSString *)selectorName name:(NSString *)name
{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:object selector:NSSelectorFromString(selectorName) name:name object:nil];
}

@end
