//
//  ViewController+Category.m
//  PBIVarAndProperty
//
//  Created by wentao lu on 2021/4/18.
//

#import "ViewController+Category.h"
#import <objc/runtime.h>

@implementation ViewController (Category)
@dynamic sex;

- (NSString *)sex {
    return objc_getAssociatedObject(self, @selector(sex));
}

- (void)setSex:(NSString *)theSex {
    objc_setAssociatedObject(self, @selector(sex), theSex, OBJC_ASSOCIATION_COPY);
}

@end
