//
//  MyUIToolkit.h
//  SinriMailTextPost
//
//  Created by Sinri Edogawa on 2019/7/3.
//  Copyright © 2019 Sinri Edogawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>


NS_ASSUME_NONNULL_BEGIN

@interface MyUIToolkit : NSObject
+(NSModalResponse)showModelErrorAlertWithTitle:(NSString*)title andContent:(NSString*)content;
@end

NS_ASSUME_NONNULL_END
