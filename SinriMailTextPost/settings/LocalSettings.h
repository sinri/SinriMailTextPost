//
//  LocalSettings.h
//  SinriMailTextPost
//
//  Created by Sinri Edogawa on 2019/7/3.
//  Copyright © 2019 Sinri Edogawa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocalSettings : NSObject
    
    +(void)setSmtpConfig:(NSString*)smtpConfigName
                    host:(NSString*)host
                    port:(NSString*)port
                 account:(NSString*)account
                password:(NSString*)password;
    +(NSDictionary*)getSmtpConfig:(NSString*)smtpConfigName;
    +(NSArray*)getSmtpConfigNameList;
    
    

@end

NS_ASSUME_NONNULL_END
