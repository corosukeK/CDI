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

#warning NotificationInject is broken(fix later)

//#define NotificationInject(className,selector, notification) implementation className ()\
//-(CDINotificationInjectorObject *)__notification_inject__ ## notification {\
//    CDINotificationInjectorObject *object = [CDINotificationInjectorObject new];\
//    object.selectorName = @selector( selector );\
//    object.notificationName = notification;\
//    return object; \
//}\
//@end\

#define SubscribeNotification(selector,n,obj)autoreleasepool{\
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];\
    [defaultCenter addObserver:self selector:selector name:n object:obj];\
}\

#define SendNotification(n,obj) autoreleasepool{\
    NSNotification *notification = [NSNotification notificationWithName:n object:obj];\
    [[NSNotificationCenter defaultCenter] postNotification:notification]; \
}\


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
