//
//  CDIUserDefaultsInjector.m
//  Pods
//
//  Created by 木村圭佑 on 2014/05/31.
//
//

#import "CDIUserDefaultsInjector.h"

#import <objc/runtime.h>

@implementation CDIUserDefaultsInjector

/**
 * Create an setter and getter it to the instance variable.
 */
+ (void)createAccessor:(NSString *)propertyName inObject:(id)instance withKey:(NSString *)key
{
    IMP getterImp = imp_implementationWithBlock(^(id self){
        NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
        return [standardDefaults objectForKey:key];
    });
    
    SEL selector = sel_registerName([propertyName cStringUsingEncoding:NSUTF8StringEncoding]);
    Method originalGetter = class_getInstanceMethod([instance class], selector);
    const char* getterTypes = method_getTypeEncoding(originalGetter);
    
    class_replaceMethod([instance class], selector, getterImp, getterTypes);
    
    IMP setterImp = imp_implementationWithBlock(^(id self, id obj){
        if(obj == nil) return ;
        NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
        [standardDefaults setObject:obj forKey:key];
        [standardDefaults synchronize];
    });

    NSString *capitalisedProperty = [propertyName stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                          withString:[[propertyName  substringToIndex:1] capitalizedString]];
    NSString *setterName = [NSString stringWithFormat:@"set%@:",capitalisedProperty];
    selector = sel_registerName([setterName cStringUsingEncoding:NSUTF8StringEncoding]);
    Method originalSetter = class_getInstanceMethod([instance class], selector);
    const char* setterTypes = method_getTypeEncoding(originalSetter);
    
    class_replaceMethod([instance class], selector, setterImp, setterTypes);
}

+ (void)createAccessor:(NSString *)propertyName inObject:(id)instance ofType:(NSString *)type withKey:(NSString *)key
{
    IMP getterImp = [self userDefaultsGetterImplementsWithKey:key ofType:type];
    SEL selector = sel_registerName([propertyName cStringUsingEncoding:NSUTF8StringEncoding]);
    Method originalGetter = class_getInstanceMethod([instance class], selector);
    const char* getterTypes = method_getTypeEncoding(originalGetter);
    
    class_replaceMethod([instance class], selector, getterImp, getterTypes);
    
    IMP setterImp = [self userDefaultsSetterImplementsWithKey:key ofType:type];
    NSString *capitalisedProperty = [propertyName stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                    withString:[[propertyName  substringToIndex:1] capitalizedString]];
    NSString *setterName = [NSString stringWithFormat:@"set%@:",capitalisedProperty];
    selector = sel_registerName([setterName cStringUsingEncoding:NSUTF8StringEncoding]);
    Method originalSetter = class_getInstanceMethod([instance class], selector);
    const char* setterTypes = method_getTypeEncoding(originalSetter);
    
    class_replaceMethod([instance class], selector, setterImp, setterTypes);

}

+ (IMP)userDefaultsSetterImplementsWithKey:(NSString *)key ofType:(NSString *)type
{
    if([type isEqualToString:@"NSUInteger"]){
        return imp_implementationWithBlock(^(id self, NSUInteger val){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            [standardDefaults setInteger:val forKey:key];
            [standardDefaults synchronize];
        });
    }else if([type isEqualToString:@"NSInteger"]){
        return imp_implementationWithBlock(^(id self, NSUInteger val){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            [standardDefaults setInteger:val forKey:key];
            [standardDefaults synchronize];
        });
    }else if([type isEqualToString:@"long"]){
        return imp_implementationWithBlock(^(id self, long val){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            [standardDefaults setInteger:val forKey:key];
            [standardDefaults synchronize];
        });
    }else if([type isEqualToString:@"int"]){
        return imp_implementationWithBlock(^(id self, int val){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            [standardDefaults setInteger:val forKey:key];
            [standardDefaults synchronize];
        });
        
    }else if([type isEqualToString:@"short"]){
        return imp_implementationWithBlock(^(id self, short val){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            [standardDefaults setInteger:val forKey:key];
            [standardDefaults synchronize];
        });
    }else if([type isEqualToString:@"double"]){
        return imp_implementationWithBlock(^(id self, double val){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            [standardDefaults setDouble:val forKey:key];
            [standardDefaults synchronize];
        });
    }else if([type isEqualToString:@"BOOL"]){
        return imp_implementationWithBlock(^(id self, BOOL val){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            [standardDefaults setBool:val forKey:key];
            [standardDefaults synchronize];
        });
    }else if([type isEqualToString:@"float"]){
        return imp_implementationWithBlock(^(id self, float val){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            [standardDefaults setFloat:val forKey:key];
            [standardDefaults synchronize];
        });
    }else if([type isEqualToString:@"NSURL"]){
        return imp_implementationWithBlock(^(id self, NSURL *url){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            [standardDefaults setURL:url forKey:key];
            [standardDefaults synchronize];
        });
    }else if([type isEqualToString:@"NSString"]){
        return imp_implementationWithBlock(^(id self, NSString *string){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            [standardDefaults setObject:string forKey:key];
            [standardDefaults synchronize];
        });
    }else if([type isEqualToString:@"NSArray"]){
        return imp_implementationWithBlock(^(id self, NSArray *array){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            [standardDefaults setObject:array forKey:key];
            [standardDefaults synchronize];
        });
    }else if([type isEqualToString:@"NSDictionary"]){
        return imp_implementationWithBlock(^(id self, NSDictionary *dictionary){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            [standardDefaults setObject:dictionary forKey:key];
            [standardDefaults synchronize];
        });
    }else if([type isEqualToString:@"NSData"]){
        return imp_implementationWithBlock(^(id self, NSData *data){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            [standardDefaults setObject:data forKey:key];
            [standardDefaults synchronize];
        });
    }else {
        return imp_implementationWithBlock(^(id self, id obj){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:obj];
            [standardDefaults setObject:data forKey:key];
            [standardDefaults synchronize];
        });
    }

}

+ (IMP)userDefaultsGetterImplementsWithKey:(NSString *)key ofType:(NSString *)type
{
    
    if([type isEqualToString:@"NSUInteger"]){
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            return [standardDefaults integerForKey:key];
        });
    }else if([type isEqualToString:@"NSInteger"]){
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            return [standardDefaults integerForKey:key];
        });
    }else if([type isEqualToString:@"long"]){
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            return [standardDefaults integerForKey:key];
        });
    }else if([type isEqualToString:@"int"]){
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            return [standardDefaults integerForKey:key];
        });
    }else if([type isEqualToString:@"short"]){
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            return [standardDefaults integerForKey:key];
        });
    }else if([type isEqualToString:@"double"]){
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            return [standardDefaults doubleForKey:key];
        });
    }else if([type isEqualToString:@"BOOL"]){
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            return [standardDefaults boolForKey:key];
        });
    }else if([type isEqualToString:@"float"]){
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            return [standardDefaults floatForKey:key];
        });
    }else if([type isEqualToString:@"NSURL"]){
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            return [standardDefaults URLForKey:key];
        });
    }else if([type isEqualToString:@"NSString"]){
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            return [standardDefaults stringForKey:key];
        });
    }else if([type isEqualToString:@"NSArray"]){
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            return [standardDefaults arrayForKey:key];
        });
    }else if([type isEqualToString:@"NSDictionary"]){
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            return [standardDefaults dictionaryForKey:key];
        });
    }else if([type isEqualToString:@"NSData"]){
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            return [standardDefaults dictionaryForKey:key];
        });
    }else {
        return imp_implementationWithBlock(^(id self){
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            NSData *original = [standardDefaults dataForKey:key];
            return [NSKeyedUnarchiver unarchiveObjectWithData:original];
        });
    }
    
}

@end
