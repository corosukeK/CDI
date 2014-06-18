//
//  CDIUserDefaultsInjector.h
//  Pods
//
//  Created by 木村圭佑 on 2014/05/31.
//
//

#import <Foundation/Foundation.h>

// This prefix is used to identify the injectable instance variable
#define __USER_DEFAULTS_INJECT_INSTANCE_PREFIX @"__user_defaults_inject_instance__"
#define __USER_DEFAULTS_INJECT_TYPE_PREFIX @"__user_defaults_inject_type__"

// usecase : @NSUserDefaultsInject(instanceName, @"YOUR_USERDEFAULTS_KEY", __instance_type__)
#define UserDefaultsInject(instanceVariableName, userDefaultsKey, ...) synthesize instanceVariableName;\
-(NSString *) __user_defaults_inject_instance__ ## __VA_ARGS__ ## __user_defaults_inject_type__ ## instanceVariableName { return userDefaultsKey; }

@interface CDIUserDefaultsInjector : NSObject

/**
 * Create an setter and getter and assign it to the instance variable.
 */
+ (void)createAccessor:(NSString *)propertyName inObject:(id)instance withKey:(NSString *)key;

/**
 * Create an setter and getter of a specific type and assign it to the instance variable.
 */
+ (void)createAccessor:(NSString *)propertyName inObject:(id)object ofType:(NSString *)type withKey:(NSString *)key;

@end
