//
//  main.m
//  对象类型的auto变量
//
//  Created by Evan on 2019/3/11.
//  Copyright © 2019 Evan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHPerson.h"

typedef void(^HHBlock)(void);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//         HHBlock block;
//         {
//             HHPerson *person = [[HHPerson alloc] init];
//             person.age = 10;
//             block = ^{
//
//             NSLog(@"----------%d", person.age);
//             };
//
//             //此处的person不会被释放，因为block是在堆上，没有被释放，而block内部对person强引用
//             //MRC&ARC: 栈空间的block不会持有外面对面。堆反之
//             NSLog(@"%@", [block class]);
//         }
        
        
//        HHPerson *person = [[HHPerson alloc] init];
//        person.age = 10;
//        HHBlock block = ^{
//
//            NSLog(@"----------%d", person.age);
//        };
//
//        //此处的person不会被释放，因为block是在堆上，没有被释放，而block内部对person强引用
//        //MRC&ARC: 栈空间的block不会持有外面对面。堆反之
//        NSLog(@"%@", [block class]);
        
        //error:在使用clang转换oc为c++代码时，可能会遇到以下问题:cannot create __weak reference in file using manual reference
        //弱引用支持方案: xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc -fobjc-arc -fobjc-runtime=ios-6.0.0 main.m
         HHBlock block;
         {
             HHPerson *person = [[HHPerson alloc] init];
             person.age = 10;
             __weak HHPerson *weakPerson = person;
             block = ^{

                 NSLog(@"----------%d", weakPerson.age);
             };
         }
        NSLog(@"--------");
    }
    
    return 0; //此处Block销毁
}
