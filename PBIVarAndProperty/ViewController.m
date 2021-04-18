//
//  ViewController.m
//  PBIVarAndProperty
//
//  Created by wentao lu on 2021/4/18.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "ViewController+Category.h"

@interface ViewController ()
@property (nonatomic, copy) NSString *name;
@end

@implementation ViewController {
    NSNumber *_age;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ivars];
//    [self properties];
//    [self methods];
}

- (void)ivars {
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self.class, &count);
    for (unsigned int i = 0; i < count; i++) {
        const char *ivarName = ivar_getName(ivarList[i]);
        NSLog(@"%@", [NSString stringWithCString:ivarName encoding:NSUTF8StringEncoding]);
    }
}

- (void)properties {
    unsigned int count = 0;
    objc_property_t *ivarList = class_copyPropertyList(self.class, &count);
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(ivarList[i]);
        NSLog(@"%@", [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]);
    }
}


- (void)methods {
    unsigned int count = 0;
    Method *method = class_copyMethodList(self.class, &count);
    for (unsigned int i = 0; i < count; i++) {
        SEL methodName = method_getName(method[i]);
        const char *selName = sel_getName(methodName);
        NSLog(@"%@", [NSString stringWithCString:selName encoding:NSUTF8StringEncoding]);
    }
}

@end
