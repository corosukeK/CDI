//
//  CDINotificationInjector.h
//  Pods
//
//  Created by 木村圭佑 on 2014/06/06.
//
//

#import <Foundation/Foundation.h>

// This prefix is used to identify the injectable instance variable
#define __NOTIFICATION_INJECT_PREFIX @"__notification_inject__"

#define NotificationInject(className,selector, notification) interface className (NotificationInjection_ ## selector ## notification)\
@end\
@implementation className (NotificationInjection_ ## selector ## notification)\
-(CDINotificationInjectorObject *)__notification_inject__ ## instanceVariableName {\
CDINotificationInjectorObject *object = [CDINotificationInjectorObject new];\
object.selectorName = selector;\
object.nnotificationName = name;\
return object; \
}\
@end\

@interface CDINotificationInjectorObject : NSObject

@property (nonatomic,copy) NSString *selectorName;
@property (nonatomic,copy) NSString *notificationName;

@end

@interface CDINotificationInjector : NSObject

/**
 * Register instanceValuable as Observer using selector and notification name.
 */
+ (void)addObserver:(id)object selectorName:(NSString *)selectorName name:(NSString *)name;

@end
